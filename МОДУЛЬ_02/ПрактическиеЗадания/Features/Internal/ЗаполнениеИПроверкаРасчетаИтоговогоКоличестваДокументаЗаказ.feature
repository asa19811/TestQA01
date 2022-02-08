﻿#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект> 

Сценарий: Проверка расчета поля Количество(итог)
* Загрузка тестовых данных и заполнение шапки 
	И Заполнение шапки докмента Заказ
* Заполняем табличную часть	
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000032' | 'Торт '        |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
* изменение количества 
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
	И в таблице "Товары" я завершаю редактирование строки
* проверка итогового количества
	И элемент формы с именем "ТоварыИтогКоличество" стал равен '2'
* изменение количества
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '4,00'
	И в таблице "Товары" я завершаю редактирование строки
* проверка итогового количества
	И элемент формы с именем "ТоварыИтогКоличество" стал равен '4'	