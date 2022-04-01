﻿#language: ru

@tree

Функционал: Практическое задание 04-1

Как тестировщик я хочу
Протестируйте заполнение следующих полей документа Заказ покупателя: Партнер, Соглашение, блокировку поля Контрагент – в случае, если не выбран Партнер

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий


Сценарий: Проверка заполнения и доступности поля контрагент
	*Создание документа
		Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
		И я нажимаю на кнопку с именем 'FormCreate'
	*Заполнение поля Партнер
		И я нажимаю кнопку выбора у поля с именем "Partner"
		Тогда открылось окно 'Партнеры'
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'            |
			| '1'   | 'Клиент 1 (1 соглашение)' |
		И в таблице "List" я выбираю текущую строку
	*Проверка заполнения поля Соглашение.
	//Ожидаемое значение "Соглашение с клиентами (расчет по документам + кредитный лимит)""
		И элемент формы 'Соглашение' стал равен 'Соглашение с клиентами (расчет по документам + кредитный лимит)'
	*Очистка поля Партнер
		И в поле с именем 'Partner' я ввожу текст ''
	*Проверка доступности поля Контрагент
		И элемент формы 'Соглашение' стал равен ''
И я закрываю все окна клиентского приложения
