from pdb import post_mortem
from django.test import TestCase, Client
from bs4 import BeautifulSoup
from django.contrib.auth.models import User
from .models import Post, Category, Tag, Comment




class TestView(TestCase):
    def setUp(self):
        self.client = Client()
        self.user_test01 = User.objects.create_user(username='test01', password='test010101')
        self.user_test02 = User.objects.create_user(username='test02', password='test020202')
        self.user_test02.is_staff = True
        self.user_test02.save()


        self.category_programming = Category.objects.create(name='programming', slug='programming')
        self.category_IU = Category.objects.create(name='IU', slug='IU')

        self.tag_python_kor = Tag.objects.create(name='파이썬 공부', slug='파이썬-공부')
        self.tag_python = Tag.objects.create(name="python", slug='python')
        self.tag_hello = Tag.objects.create(name='hello', slug='hello')
        
        # p.353
        self.post_001 = Post.objects.create(
            id = 1,
            title='첫 번째 포스트입니다.',
            content="hello World. We are the world.",
            category=self.category_programming,
            author=self.user_test01
        )
        self.post_001.tags.add(self.tag_hello)

        self.post_002 = Post.objects.create(
            id = 2,
            title='두 번째 포스팅입니다.',
            content='1등이 전부는 아니잖아요?',
            category=self.category_IU,
            author=self.user_test02
        )
        
        self.post_003 = Post.objects.create(
            id = 3,
            title='세 번째 포스트입니다.',
            content='category가 없을 수도 있죠',
            author=self.user_test02
        )
        self.post_003.tags.add(self.tag_python_kor)
        self.post_003.tags.add(self.tag_python)
        
        self.comment_001 = Comment.objects.create(
            id = 1,
            post=self.post_001,
            author=self.user_test01,
            content='첫 번째 댓글입니다. '
        )
        
    def test_tag_page(self):
        response = self.client.get(self.tag_hello.get_absolute_url())
        self.assertEqual(response.status_code, 200)
        soup = BeautifulSoup(response.content, 'html.parser')
        
        self.navbar_test(soup)
        self.category_card_test(soup)
        
        self.assertIn(self.tag_hello.name, soup.h1.text)
        
        main_area = soup.find('div', id='main-area')
        self.assertIn(self.tag_hello.name, main_area.text)
        self.assertIn(self.post_001.title, main_area.text)
        self.assertNotIn(self.post_002.title, main_area.text)
        self.assertNotIn(self.post_003.title, main_area.text)

        
    def navbar_test(self, soup):
        navbar = soup.nav
        self.assertIn('Blog', navbar.text)
        self.assertIn('About Me', navbar.text)

        logo_btn = navbar.find('a', text='Do It Django')
        self.assertEqual(logo_btn.attrs['href'], '/')

        home_btn = navbar.find('a', text='Home')
        self.assertEqual(home_btn.attrs['href'], '/')
        
        blog_btn = navbar.find('a', text='Blog')
        self.assertEqual(blog_btn.attrs['href'], '/blog/')
        
        about_me_btn = navbar.find('a', text='About Me')
        self.assertEqual(about_me_btn.attrs['href'], '/about/')

    def category_card_test(self, soup):
        categories_card = soup.find('div', id='categories-card')
        self.assertIn('Categories', categories_card.text)
        self.assertIn(f'{self.category_programming.name} ({self.category_programming.post_set.count()})', categories_card.text)
        self.assertIn(f'{self.category_IU.name} ({self.category_IU.post_set.count()})', categories_card.text)

    def test_post_list(self):                # p.251
        self.assertEqual(Post.objects.count(), 3)
        
        response = self.client.get('/blog/')
        self.assertEqual(response.status_code, 200)
        soup = BeautifulSoup(response.content, 'html.parser')
        
        self.navbar_test(soup)
        self.category_card_test(soup)
        
        main_area = soup.find('div', id='main-area')

        self.assertNotIn('아직 게시물이 없습니다.', main_area.text)
        
        post_001_card = main_area.find('div', id='post-1')   # p.355
        print("111111111111111", self.post_001.title, post_001_card)

        self.assertIn(self.post_001.title, post_001_card.text)
        self.assertIn(self.post_001.category.name, post_001_card.text)
        self.assertIn(self.post_001.author.username.upper(), post_001_card.text)        
        self.assertIn(self.tag_hello.name, post_001_card.text)
        self.assertNotIn(self.tag_python.name, post_001_card.text)
        self.assertNotIn(self.tag_python_kor.name, post_001_card.text)
        
        post_002_card = main_area.find('div', id='post-2')
        self.assertIn(self.post_002.title, post_002_card.text)
        self.assertIn(self.post_002.category.name, post_002_card.text)
        self.assertNotIn(self.tag_hello.name, post_002_card.text)
        self.assertNotIn(self.tag_python.name, post_002_card.text)
        self.assertNotIn(self.tag_python_kor.name, post_002_card.text)

        post_003_card = main_area.find('div', id='post-3')
        self.assertIn('미분류', post_003_card.text)
        self.assertIn(self.post_003.title, post_003_card.text)
        self.assertIn(self.post_003.author.username.upper(), post_003_card.text)
        self.assertNotIn(self.tag_hello.name, post_003_card.text)
        self.assertIn(self.tag_python.name, post_003_card.text)
        self.assertIn(self.tag_python_kor.name, post_003_card.text)
                
        self.assertIn(self.user_test01.username.upper(), main_area.text)
        self.assertIn(self.user_test02.username.upper(), main_area.text)
        
        # 포스트가 없는 경우
        Post.objects.all().delete()
        self.assertEqual(Post.objects.count(), 0)
        response = self.client.get('/blog/')
        soup = BeautifulSoup(response.content, 'html.parser')
        main_area = soup.find('div', id='main-area')
        self.assertIn('아직 게시물이 없습니다.', main_area.text)
        

        
    def test_post_detail(self):         # p.259, 333

        # print(self.post_001.get_absolute_url())
        self.assertEqual(self.post_001.get_absolute_url(), '/blog/1/')
        # print(object, "11111")
        
        response = self.client.get(self.post_001.get_absolute_url())
        self.assertEqual(response.status_code, 200)
        soup = BeautifulSoup(response.content, 'html.parser')

        self.navbar_test(soup)
        self.category_card_test(soup)
        
        self.assertIn(self.post_001.title, soup.title.text)
        
        main_area = soup.find('div', id='main-area')
        post_area = main_area.find('div', id='post-area')
        self.assertIn(self.post_001.title, post_area.text)
        self.assertIn(self.category_programming.name, post_area.text)

        self.assertIn(self.user_test01.username.upper(), post_area.text)
        self.assertIn(self.post_001.content, post_area.text)
        
        self.assertIn(self.tag_hello.name, post_area.text)
        self.assertNotIn(self.tag_python.name, post_area.text)
        self.assertNotIn(self.tag_python_kor.name, post_area.text)
        
        # comment area
        comments_area = soup.find('div', id='comment-area')
        comment_001_area = comments_area.find('div', id='comment-1')
        print("5555555556666666666", comment_001_area, comments_area)
        self.assertIn(self.comment_001.author.username, comment_001_area.text)
        print("777777777778888888888", comment_001_area, comments_area)
        self.assertIn(self.comment_001.content, comment_001_area.text)
        print("999999990000000000", comment_001_area, comments_area)
        

    def test_category_page(self):
        response = self.client.get(self.category_programming.get_absolute_url())
        self.assertEqual(response.status_code, 200)
        
        soup = BeautifulSoup(response.content, 'html.parser')
        self.navbar_test(soup)
        self.category_card_test(soup)
        
        self.assertIn(self.category_programming.name, soup.h1.text)
        
        main_area = soup.find('div', id='main-area')
        self.assertIn(self.category_programming.name, main_area.text)
        self.assertIn(self.post_001.title, main_area.text)
        self.assertNotIn(self.post_002.title, main_area.text)
        self.assertNotIn(self.post_003.title, main_area.text)


    def test_create_post(self):
        # 로그인하지 않으면 status code가 200이면 안된다!
        response = self.client.get('/blog/create_post/')
        self.assertNotEqual(response.status_code, 200)
        
        # staff가 아닌 test01이 로그인을 한다.
        self.client.login(username='test01', password='test010101')
        response = self.client.get('/blog/create_post/')
        self.assertNotEqual(response.status_code, 200)
        
        # staff인 test02로 로그인한다.
        self.client.login(username='test02', password='test020202')
        response = self.client.get('/blog/create_post/')
        self.assertEqual(response.status_code, 200)
        soup = BeautifulSoup(response.content, 'html.parser')
        
        self.assertEqual('Create Post - Blog', soup.title.text)
        main_area = soup.find('div', id='main-area')
        self.assertIn('Create New Post', main_area.text)

        tag_str_input = main_area.find('input', id='id_tags_str')
        self.assertTrue(tag_str_input)

        self.client.post(
            '/blog/create_post/',
            {
                'title': 'Post Form 만들기',
                'content': "Post Form 페이지를 만듭시다.",
                'tags_str': 'new tag; 한글 태그, python'
            }
        )
        
        print("ffffffffffffffffff", Post.objects.get(title="Post Form 만들기"))
        print("ffffffffffffffffffaaaaaaaa", Tag.objects.get(name="newtag"))
        
        self.assertEqual(Post.objects.count(), 4)
        last_post = Post.objects.last()
        self.assertEqual(last_post.title, "Post Form 만들기")
        self.assertEqual(last_post.author.username, 'test02')

        self.assertEqual(last_post.tags.count(), 3)
        
        print("3333333333333", Tag.objects.get(name="newtag"))
        self.assertTrue(Tag.objects.get(name='한글태그'))
        self.assertTrue(Tag.objects.get(name='python'))
        self.assertEqual(Tag.objects.count(), 5)


    def test_update_post(self):
        update_post_url = f'/blog/update_post/{self.post_003.pk}/'
        
        # 로그인하지 않은 경우
        response = self.client.get(update_post_url)
        self.assertNotEqual(response.status_code, 200)
        
        # 로그인은 했지만 작성자가 아닌 경우
        self.assertNotEqual(self.post_003.author, self.user_test01)
        self.client.login(
            username=self.user_test01.username,
            password='test010101'
        )
        response = self.client.get(update_post_url)
        self.assertEqual(response.status_code, 403)
        
        # 작성자(test02)가 접근하는 경우
        self.client.login(
            username=self.post_003.author.username,
            password='test020202'
        )
        response = self.client.get(update_post_url)
        self.assertEqual(response.status_code, 200)
        soup = BeautifulSoup(response.content, 'html.parser')
        
        self.assertEqual('Edit Post - Blog', soup.title.text)
        main_area = soup.find('div', id='main-area')
        self.assertIn('Edit Post', main_area.text)
        
        tag_str_input = main_area.find('input', id='id_tags_str')
        self.assertTrue(tag_str_input)
        self.assertIn('파이썬 공부; python', tag_str_input.attrs['value'])
        
        response = self.client.post(
            update_post_url,
            {
                'title': '세 번째 포스트를 수정했습니다. ',
                'content': '안녕 세계? 우리는 하나!',
                'category': self.category_IU.pk,
                'tags_str': '파이썬 공부, 한글 태그, some tag'
            },
            follow=True
        )
        soup = BeautifulSoup(response.content, 'html.parser')
        main_area = soup.find('div', id='main-area')
        self.assertIn('세 번째 포스트를 수정했습니다.', main_area.text)
        self.assertIn('안녕 세계? 우리는 하나!', main_area.text)
        self.assertIn(self.category_IU.name, main_area.text)
        self.assertIn('파이썬공부', main_area.text)
        self.assertIn('한글태그', main_area.text)
        self.assertIn('sometag', main_area.text)
        self.assertNotIn('python', main_area.text)


    def test_comment_form(self):
        self.assertEqual(Comment.objects.count(), 1)
        self.assertEqual(self.post_001.comment_set.count(), 1)
        
        # 로그인아지 않은 상태
        response = self.client.get(self.post_001.get_absolute_url())
        self.assertEqual(response.status_code, 200)
        soup = BeautifulSoup(response.content, 'html.parser')
        
        comment_area = soup.find('div', id='comment-area')
        self.assertIn('Log in and leave a comment', comment_area.text)
        self.assertFalse(comment_area.find('form', id='comment-form'))

        # 로그인한 상태
        self.client.login(username='test02', password='test020202')
        response = self.client.get(self.post_001.get_absolute_url())
        self.assertEqual(response.status_code, 200)
        soup = BeautifulSoup(response.content, 'html.parser')
        
        comment_area = soup.find('div', id='comment-area')
        self.assertNotIn('Log in and leave a comment', comment_area.text)
        
        comment_form = comment_area.find('form', id='comment-form')
        self.assertTrue(comment_form.find('textarea', id='id_content'))
        response = self.client.post(
            self.post_001.get_absolute_url() + 'new_comment/',
            {
                'content': "test02의 댓글입니다.",
            },
            follow=True
        )
        
        self.assertEqual(response.status_code, 200)
        
        self.assertEqual(Comment.objects.count(), 2)
        self.assertEqual(self.post_001.comment_set.count(), 2)
        new_comment = Comment.objects.last()
        
        soup = BeautifulSoup(response.content, 'html.parser')
        self.assertIn(new_comment.post.title, soup.title.text)
        
        comment_area = soup.find('div', id='comment-area')
        new_comment_div = comment_area.find('div', id=f'comment-{new_comment.pk}')
        self.assertIn('test02', new_comment_div.text)
        self.assertIn('test02의 댓글입니다.', new_comment_div.text)

        

