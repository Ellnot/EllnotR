﻿#language: ru

@tree

Функционал: создание документа Поступления товаров

Как Менеджер по закупка я хочу
создание документа поступления товаров
чтобы поставить товар на учет   

Контекст:
	// Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: создание документа поступления товаров
// Создание документа 
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Закупки' 'Поступления товаров'
	Тогда открылось окно 'Поступления товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Поступление товара (создание)'
* Заполнение шапки документов
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'
	//
	Тогда элемент формы с именем "Склад" стал равен 'Склад отдела продаж'
	//
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
	И я нажимаю кнопку выбора у поля с именем "Поставщик"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000012' | 'Мосхлеб ОАО'  |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Поступление товара (создание) *'
* Заполнение товарной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000011' | 'Продукты'     |
	И в таблице  "Список" я перехожу на один уровень вниз
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000030' | 'Колбаса'      |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно 'Поступление товара (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10,00'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я завершаю редактирование строки
	
* проверка заполнения табличной части
	Тогда таблица "Товары" содержит строки:
		| 'Товар'   | 'Артикул' | 'Цена'   | 'Количество' | 'Сумма'    |
		| 'Колбаса' | 'Kol67'   | '250,00' | '15,00'      | '2 500,00' |
	И Я нажимаю на кнопку "Записать"
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
	* Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер' |
		| '$Номер$'   |
	
	Сценарий: проверка наличия "ТОРТ"
		И В командном интерфейсе я выбираю 'Продажи' 'Товары'
		Тогда открылось окно 'Товары'
		И я нажимаю на кнопку с именем 'ФормаСписок'
		И таблица "Список" содержит строки:
			| 'Наименование' |
			| 'Торт'   |