from django.test import TestCase, Client
from bs4 import BeautifulSoup
from django.contrib.auth.models import User
from .models import Post, Category




class TestView(TestCase):
    def setUp(self):
        self.client = Client()
        self.user_test01 = User.objects.create_user(username='test01', password='test010101')
        self.user_test02 = User.objects.create_user(username='test02', password='test020202')

        self.category_programming = Category.objects.create(name='programming', slug='programming')
        self.category_iu = Category.objects.create(name='iu', slug='iu')

        self.post_001 = Post.objects.create(
            title='첫 번째 포스트입니다.',
            content="hello World. We are the world.",
            category=self.category_programming,
            author=self.user_test01
        )

        self.post_002 = Post.objects.create(
            title='두 번째 포스팅입니다.',
            content='1등이 전부는 아니잖아요?',
            category=self.category_iu,
            author=self.user_test02
        )
        
        self.post_003 = Post.objects.create(
            title='세 번째 포스트입니다.',
            content='category가 없을 수도 있죠',
            author=self.user_test02
        )
        
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
        
        post_001_card = main_area.find('div', id='post-1')
        self.assertIn(self.post_001.title, post_001_card.text)
        self.assertIn(self.post_001.category.name, post_001_card.text)
        
        post_002_card = main_area.find('div', id='post-2')
        self.assertIn(self.post_002.title, post_002_card.text)
        self.assertIn(self.post_002.category.name, post_002_card.text)
        
        post_003_card = main_area.find('div', id='post-3')
        self.assertIn('미분류', post_003_card.text)
        self.assertIn(self.post_003.title, post_003_card.text)
        
        self.assertIn(self.user_test01.username.upper(), main_area.text)
        self.assertIn(self.user_test02.username.upper(), main_area.text)
        
        # 포스트가 없는 경우
        Post.objects.all().delete()
        self.assertEqual(Post.objects.count(), 0)
        response = self.client.get('/blog/')
        soup = BeautifulSoup(response.content, 'html.parser')
        main_area = soup.find('div', id='main-area')
        self.assertIn('아직 게시물이 없습니다.', main_area.text)
        

        
    def test_post_detail(self):         # p.259
        # 1.1. 포스트가 하나 있다.
        post_001 = Post.objects.create(
            title='첫 번째 포스트입니다.',
            content='Hello World. We are the world.',
            author=self.user_test01,
        )
        # 1.2. 그 포스트의 url은 '/blog/1/' 이다.
        self.assertEqual(post_001.get_absolute_url(), '/blog/1/')
        
        # 2. 첫 번째 포스트의 상세 페이지 테스트
        # 2.1. 첫 번째 포스트의 url로 접근하면 정상적으로 작동한다(status code: 200).
        response = self.client.get(post_001.get_absolute_url())
        self.assertEqual(response.status_code, 200)
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # 2.3. 첫 번째 포스트의 제목이 웹 브라우저 탭 타이틀에 들어 있다.
        self.assertIn(post_001.title, soup.title.text)
        
        # 2.4. 첫 번째 포스트의 제목이 포스트 영역에 있다.
        main_area = soup.find('div', id='main-area')
        post_area = main_area.find('div', id='post-area')
        self.assertIn(post_001.title, post_area.text)

        # 2.5. 첫 번째 포스트의 작성자(author)가 포스트 영역에 있다.
        self.assertIn(self.user_test01.username.upper(), post_area.text)
        
        # 2.6. 첫 번째 포스트의 내용(content)이 포스트 영역에 있다.
        self.assertIn(post_001.content, post_area.text)
        


        