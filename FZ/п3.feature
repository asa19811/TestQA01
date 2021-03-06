#language: ru

@tree

Функционал: Финальное практическое задание. 3.

Добавлен документ РасходТовара (Продажи – Документ Продажи). Необходимо написать тесты
для его полной проверки, включая проведение, движения по регистрам, а также печатные формы
Расходная товарная накладная (в печатной форме проверка по заполнению значения в поле Дата
не нужна).

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий
//	И я закрываю все окна клиентского приложения

Сценарий: Док_Расход товаров. Создание и заполнение документа
	*Загрузим цены
		Тогда Загрузка цен
	*Создание и заполнение документа 
		И Я открываю навигационную ссылку "e1cib/list/ЖурналДокументов.ДокументыПродаж"
		И я нажимаю на кнопку с именем 'ФормаСоздатьПоПараметруРасходТовара'
	*Заполнение шапки
		И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
		И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'
		И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Закупочная'			
	*Добавление товара
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
		Тогда открылось окно 'Товары'
	* переход к группе товаров.
		И в таблице  "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000001' | 'Обувь'      |
		и в таблице "Список" я перехожу на один уровень вниз
	* выбор товара в группе товаров		
		И в таблице "Список" я	перехожу к строке
			| 'Наименование' | 'Код'       |
			| 'Босоножки'    | '000000031' |
		И в таблице "Список" я выбираю текущую строку
Сценарий: Док_Расход товаров. Проверка изменения цены и количества	
			*Изменение цены и количества
				Когда открылось окно 'Продажа товара (создание) *'
				И в таблице "Товары" я выбираю текущую строку
				И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '10,00'
				И в таблице "Товары" я завершаю редактирование строки
			*Проверка расчета итоговой суммы
				И Элементформы с именем "ТоварыИтогСумма" стал равен 10
			*Изменение цены и количества
				И в таблице "Товары" я выбираю текущую строку
				И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2,00'
				И в таблице "Товары" я завершаю редактирование строки
			*Проверка расчета итоговой суммы
				И Элементформы с именем "ТоварыИтогСумма" стал равен 20		
			*Изменение цены и количества
				И в таблице "Товары" я выбираю текущую строку
				И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '30,00'
				И в таблице "Товары" я завершаю редактирование строки
			*Проверка расчета итоговой суммы
				И Элементформы с именем "ТоварыИтогСумма" стал равен 60
				Когда открылось окно 'Продажа товара (создание) *'
Сценарий: Док_Расход товаров. Проверка изменения вида цены в шапке документа при измененни покупателя
			*Изменим контрагента и проверим измененеие вида цены
				И я нажимаю кнопку выбора у поля с именем "Покупатель"
				Тогда открылось окно 'Контрагенты'
				И в таблице  "Список" я перехожу к строке:
				| 'Код'       | 'Наименование' |
				| '000000002' | 'Покупатели'   |
				И в таблице "Список" я выбираю текущую строку
				И в таблице "Список" я перехожу к строке:
					| 'Наименование'              | 'Код'       |
					| 'Шлюзовая ООО'              | '000000004' |
				И в таблице "Список" я выбираю текущую строку
				Тогда элемент формы с именем 'ВидЦен' стал равен 'Оптовая'			
				//И я нажимаю кнопку выбора у поля с именем "Покупатель"
			*Изменим контрагента и проверим изменение вида цены	
//				И в поле с именем 'Покупатель' я ввожу текст '000000015'
//				И Пауза 5
//				Когда открылось окно 'Продажа товара (создание) *'
				И из выпадающего списка с именем "Покупатель" я выбираю по строке '000000015'
																
				//И из выпадающего списка с именем "Покупатель" я выбираю точное значение '000000015 Магазин "Обувь"'				
				Тогда элемент формы с именем 'ВидЦен' стал равен 'Розничная'

Сценарий: Док_Расход товаров. Проверка поля Валюта взаиморасчетов 			
			*Изменим организацию и проверим поле Валюта
				И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
				И элемент формы с именем "Валюта" присутствует на форме
			*Изменим организацию и проверим поле Валюта
				И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
				И элемент формы с именем "Валюта" отсутствует на форме

Сценарий: Док_Расход товаров. Проверка пересчета строк при изменении вида цены 
		*Изменим ВидЦен и проверим расчет цены Закупочная 
			И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Закупочная'
			И таблица "Товары" стала равной:
				| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
				| 'Босоножки' | '1 500,00' | '2,00'       | '3 000,00' |
		*Изменим ВидЦен и проверим расчет цены Розничная 						
			И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Розничная'
			И таблица "Товары" стала равной:
			| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
			| 'Босоножки' | '2 500,00' | '2,00'       | '5 000,00' |					

Сценарий: Док_Расход товаров. Проверка формы подбора
	*Откроем форму подбора							
		И в таблице "Товары" я нажимаю на кнопку с именем 'КомандаПодбор'
		Когда открылось окно 'Подбор товара'
	*Выбор товара в форме подбора
		И в таблице "ДеревоТоваров" я разворачиваю текущую строку
		И в таблице "ДеревоТоваров" я перехожу к строке:
			| 'Наименование' |
			| 'Обувь'        |
		И в таблице "СписокТоваров" я перехожу к строке:
			| 'Код'       | 'Наименование' | 'Цена'     |
			| '000000020' | 'Валенки'      | '2 100,00' |
		И в таблице "СписокТоваров" я выбираю текущую строку
	*Проверим добавление товара в отобранные товары
		Тогда таблица "Товары" стала равной:
			| 'Товар'     | 'Количество' |
			| 'Босоножки' | '2,00'       |
			| 'Валенки'   | '1,00'       |
	*Увеличим количество двойным кликом по товару
		И в таблице "СписокТоваров" я перехожу к строке:
			| 'Код'       | 'Наименование' | 'Цена'     |
			| '000000020' | 'Валенки'      | '2 100,00' |
		И в таблице "СписокТоваров" я выбираю текущую строку
	*Проверим увеличение количества товара в отобранных товарах
		Тогда таблица "Товары" стала равной:
				| 'Товар'     | 'Количество' |
				| 'Босоножки' | '2,00'       |
				| 'Валенки'   | '2,00'       |
	*Перенесем выбранные товары в документ				
		И я нажимаю на кнопку с именем 'ОК'
	*Проверим табличную часть документа
		Тогда таблица "Товары" стала равной:
			| 'N' | 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
			| '1' | 'Босоножки' | '2 500,00' | '2,00'       | '5 000,00' |
			| '2' | 'Валенки'   | '2 100,00' | '2,00'       | '4 200,00' |
	*Откроем форму подбора и удалим товар
		И в таблице "Товары" я нажимаю на кнопку с именем 'КомандаПодбор'
		Тогда открылось окно 'Подбор товара'
		И в таблице "Товары" я перехожу к строке:
			| 'Количество' | 'Товар'   |
			| '2,00'       | 'Валенки' |
		И я выбираю пункт контекстного меню с именем 'ТоварыКонтекстноеМенюУдалить' на элементе формы с именем "Товары"
		И я нажимаю на кнопку с именем 'ОК'
	*Проверим табличную часть документа
		Тогда таблица "Товары" стала равной:
			| 'N' | 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
			| '1' | 'Босоножки' | '2 500,00' | '2,00'       | '5 000,00' |
	*Отображение количества в форме подбора
		И в таблице "Товары" я нажимаю на кнопку с именем 'КомандаПодбор'
		Тогда открылось окно 'Подбор товара'
		И в таблице "ДеревоТоваров" я разворачиваю текущую строку
		И в таблице "ДеревоТоваров" я перехожу к строке:
			| 'Наименование' |
			| 'Обувь'        |
		И в таблице "СписокТоваров" я перехожу к строке:
			| 'Код'       | 'Наименование' |
			| '000000031' | 'Босоножки'    |
	*проверим количество в форме подбора		
		Тогда таблица "СписокТоваров" содержит строки:
			| 'Наименование' | 'Код'       | 'Количество' |
			| 'Босоножки'    | '000000031' | '10,00'      |
	И я нажимаю на кнопку с именем 'Отмена'

Сценарий: Док_Расход товаров. Запись и проведение документа
	* запись документа
	И я нажимаю на кнопку "Записать"
	* Номер  
		И я запоминаю значение поля "Номер" как "$Номер$"
	* проведение документа	
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
	* Проверка создания документа	
	И в таблице "Список" я перехожу к строке:
		| 'Номер'   |
		| '$Номер$' |
	И в таблице "Список" я выбираю текущую строку
	
Сценарий: Док_Расход товаров. Проверка проведения по регистрам		
	*Проверим движения документов
		*Регистр продаж
			И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'
			Тогда таблица "Список" содержит строки:
				| 'Покупатель'      | 'Сумма'    | 'Товар'     | 'Количество' |
				| 'Магазин "Обувь"' | '5 000,00' | 'Босоножки' | '2,00'       |
		*Регистр товарных запасов
			И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр товарных запасов'				
			Тогда таблица "Список" содержит строки:
				| 'Склад'               | 'Товар'     | 'Количество' |
				| 'Склад отдела продаж' | 'Босоножки' | '2,00'       |
		*Регистр взаиморасчетов с контрагентами
			И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр взаиморасчетов с контрагентами'
			Тогда таблица "Список" содержит строки:
				| 'Контрагент'      | 'Сумма'    | 'Валюта' |
				| 'Магазин "Обувь"' | '5 000,00' | ''       |

Сценарий: Док_Расход товаров. Проверка печатных форм
	*Печать расходной накладной
		И В текущем окне я нажимаю кнопку командного интерфейса 'Основное'
		И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
		Тогда табличный документ "SpreadsheetDocument" содержит строки по шаблону:
			| 'Расход товара' | ''                    | ''           | ''      |
			| ''              | ''                    | ''           | ''      |
			| 'Номер'         | '*'                   | ''           | ''      |
			| 'Дата'          | '*'                   | ''           | ''      |
			| 'Покупатель'    | 'Магазин "Обувь"'     | ''           | ''      |
			| 'Склад'         | 'Склад отдела продаж' | ''           | ''      |
			| 'Сумма'         | '5 000 (Пять тысяч)'  | ''           | ''      |
			| ''              | ''                    | ''           | ''      |
			| 'Товар'         | 'Цена'                | 'Количество' | 'Сумма' |
			| 'Босоножки'     | '2 500'               | '2'          | '5 000' |
		И я закрываю текущее окно
	*Печать Доставка
		И я нажимаю на кнопку с именем 'ФормаОформитьДоставку'
		Тогда табличный документ "ТабличныйДокумент" равен:
			| 'Заявка на доставку товара'         | ''               |
			| ''                                  | ''               |
			| 'Прошу доставить товары по адресу:' | ''               |
			| ''                                  | ''               |
			| ''                                  | ''               |
			| 'Срок доставки:'                    | ''               |
			| 'Дата доставки'                     | ''               |
			| ''                                  | ''               |
			| 'Дата:'                             | '*'              |
			| 'Подпись:'                          | ''               |
		И я закрываю текущее окно
		И В текущем окне я нажимаю кнопку командного интерфейса 'Основное'
	Сценарий: Док_Расход товаров. Проверка ввода на основании. Поступление денег
		И В текущем окне я нажимаю кнопку командного интерфейса 'Основное'
		И я нажимаю на кнопку с именем 'ФормаДокументПоступлениеДенегСоздатьНаОсновании'
		Если текущее окно имеет заголовок "Поступление денег (создание)" Тогда
				Тогда элемент формы с именем "Организация" стал равен 'ООО \"1000 мелочей\"'
				И элемент формы с именем "Номер" стал равен ''
				И элемент формы с именем "Покупатель" стал равен 'Магазин "Обувь"'
				И элемент формы с именем "РасчетныйСчетПокупателя" стал равен ''
				И элемент формы с именем "РасчетныйСчет" стал равен ''
				И элемент формы с именем "Валюта" стал равен ''
				И у элемента формы с именем "Сумма" текст редактирования стал равен '0,00'
				
				
			
				
								
			
									
							
