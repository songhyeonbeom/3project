# Generated by Django 4.0.4 on 2022-04-25 08:28

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('username', models.CharField(max_length=20, unique=True, verbose_name='username')),
                ('email', models.EmailField(max_length=255, verbose_name='email')),
                ('realname', models.CharField(max_length=20, null=True, verbose_name='realname')),
                ('birth_date', models.DateField(blank=True, null=True, verbose_name='birth_date')),
                ('phone', models.CharField(max_length=11, null=True, verbose_name='phone')),
                ('gender', models.IntegerField(null=True, verbose_name='gender')),
                ('gender2', models.CharField(max_length=5, null=True, verbose_name='gender2')),
                ('is_active', models.BooleanField(default=True)),
                ('is_admin', models.BooleanField(default=False)),
            ],
            options={
                'abstract': False,
            },
        ),
    ]
