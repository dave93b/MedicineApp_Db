INSERT Manufacturer
(ManufacturerName, ManufacturerCity, ManufacturerStreet, ManufacturerHouseNumber)
VALUES
('������', '����', '������', '60'),
('�������', '����', '�������������', '13'),
('�����', '����', '������������', '55')
GO

INSERT Pharmacy
(PharmacyName, PharmacyCity, PharmacyStreet, PharmacyHouseNumber)
VALUES
('������� ���', '����', '��������', '20'),
('������� ���', '�����', '���������', '18'),
('��������', '������', '����� ����������', '1')
GO

INSERT MedicineUnit
(MedicineUnitName)
VALUES
('������'),
('��')
GO

INSERT MedicineForm
(MedicineFormName)
VALUES
('��������'),
('����'),
('�����')
GO

INSERT Medicine
(MedicineName, MedicineFormId, Quantity, Weight, MedicineUnitId, ManufacturerId, Price, 
PharmacyId, DeliveryDate, InvoiceNumber)
VALUES
('�����', 1, 20, 100, 1, 1, 60.85, 2, '20.02.2016', '234123'),
('��������', 2, 100, 50, 1, 2, 129.99, 2, '10.01.2016', '234111'),
('��������', 3, 60, 50, 2, 3, 80.95, 3, '12.01.2016', '234115'),
('��������', 2, 45, 58, 1, 1, 21.09, 1, '16.12.2015', '234465'),
('��������', 3, 120, 25, 2, 1, 11.16, 1, '27.02.2016', '234124'),
('�������� �����', 1, 70, 30, 1, 1, 30.05, 1, '30.01.2016', '234998'),
('�������', 1, 100, 30, 1, 3, 109.99, 1, '15.11.2015', '234247'),
('������ ���', 1, 60, 20, 1, 2, 42.59, 1, '14.01.2016', '234223'),
('��-���', 1, 80, 30, 1, 2, 37.95, 2, '31.01.2016', '234110'),
('��������', 2, 30, 100, 1, 2, 297.95, 2, '07.02.2016', '234668'),
('��������', 3, 50, 20, 2, 3, 127.63, 2, '10.12.2015', '234098'),
('�����', 2, 60, 28, 1, 1, 156.94, 3, '20.02.2016', '234212'),
('���������', 1, 20, 40, 1, 3, 190.65, 3, '01.03.2016', '234851'),
('������', 1, 80, 20, 1, 2, 58.85, 3, '22.01.2016', '234902'),
('�����', 1, 100, 30, 1, 3, 76.89, 3, '10.11.2015', '234444')
GO