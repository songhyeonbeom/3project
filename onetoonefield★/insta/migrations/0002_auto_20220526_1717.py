# Generated by Django 3.2 on 2022-05-26 08:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('insta', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('slug', models.SlugField(allow_unicode=True, max_length=200, unique=True)),
            ],
        ),
        migrations.AlterField(
            model_name='album',
            name='slug',
            field=models.SlugField(allow_unicode=True, unique=True),
        ),
    ]
