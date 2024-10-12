from django.core.exceptions import ObjectDoesNotExist
from django.http import HttpResponse
from django.shortcuts import render
from django.views.generic import TemplateView
from .registration_form import UserRegister
from .models import Buyer, Game


def index(request):
    pagename = 'Главная страница'
    sub_name = 'Реферальные переходы'
    context = {
        'pagename': pagename,
        'sub_name': sub_name,
    }
    return render(request, 'index.html', context)

def menu(request):
    return render(request, 'menu.html')

def second(request):
    games = Game.objects.all()
    context = {
        'games': games,
    }
    return render(request, 'second_page.html', context)

class Third(TemplateView):
    template_name = 'third_page.html'
    extra_context = {
        'pagename': 'Статистика',
        'sub_name': 'Under construction!'
    }

def sign_up_by_django(request): # функция обработки django формы
    users = Buyer.objects.all()  # объявляем список пользователей для проверки на наличие
    info = {}  # объявляем пустой словарь, в котором будут храниться ошибки с ключом 'error'
    errors = []  # объявляем пустой список для сбора ошибок

    if request.method == 'POST': # проверяем какой тип запроса пришел, если POST получаем данные от пользователя
        form = UserRegister(request.POST) # объявляем объект формы
        if form.is_valid(): # получаем данные формы и проверяем корректность данных для исключения обхода типов полей
            username = form.cleaned_data.get('username') # получаем от пользователя имя
            password = form.cleaned_data.get('password') # получаем от пользователя пароль
            repeat_password = form.cleaned_data.get('repeat_password') # получаем от пользователя повтор пароля
            age = int(form.cleaned_data.get('age')) # получаем от пользователя возраст

            try:
                user = users.get(name=username) # проверяем есть ли пользователь в базе данных
                if user:
                    errors.append('Пользователь уже существует')  # если пользователь есть в базе, фиксируем ошибку
            except ObjectDoesNotExist:
                Buyer.objects.create(name=username, age=age)

    else:
        form = UserRegister() # если пришел GET запрос показываем пустую форму

    info['error'] = errors # передаем список ошибок в словарь
    return render(request, 'registration_page.html', {'form': form, 'info': info})
    # отрисовываем шаблон и передаем в него форму и ошибки для отображения
