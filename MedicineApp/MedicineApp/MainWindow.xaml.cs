using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace MedicineApp
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        MedicineDbEntities context = new MedicineDbEntities();

        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            var items = from manufacturer in context.Manufacturers.ToList()
                select new
                {
                    Название = manufacturer.ManufacturerName,
                    Город = manufacturer.ManufacturerCity,
                    Улица = manufacturer.ManufacturerStreet,
                    Дом = manufacturer.ManufacturerHouseNumber
                };

            dataGrid.ItemsSource = items;
        }

        private void manufacturer_Click(object sender, RoutedEventArgs e)
        {
            var items = from manufacturer in context.Manufacturers.ToList()
                select new
                {
                    Название = manufacturer.ManufacturerName,
                    Город = manufacturer.ManufacturerCity,
                    Улица = manufacturer.ManufacturerStreet,
                    Дом = manufacturer.ManufacturerHouseNumber
                };

            dataGrid.ItemsSource = items;
        }

        private void medicines_Click(object sender, RoutedEventArgs e)
        {
            var items = from supply in context.Supplies.ToList()
                        join medicine in context.Medicines.ToList() on supply.MedicineId equals medicine.MedicineId
                join medicineUnits in context.MedicineUnits.ToList() on medicine.MedicineUnitId equals
                    medicineUnits.MedicineUnitId
                join manufacturer in context.Manufacturers on medicine.ManufacturerId equals manufacturer.ManufacturerId
                join form in context.MedicineForms on medicine.MedicineFormId equals form.MedicineFormId
                join pharmacy in context.Pharmacies on supply.PharmacyId equals pharmacy.PharmacyId
                select new
                {
                    НазваниеЛекарства = medicine.MedicineName,
                    Форма = form.MedicineFormName,
                    Производитель = manufacturer.ManufacturerName,
                    Аптека = pharmacy.PharmacyName,
                    Количество = supply.Quantity,
                    Вес = medicine.Weight + medicineUnits.MedicineUnitName,
                    Цена = medicine.Price + " грн",
                    ДатаПоставки = supply.DeliveryDate.ToShortDateString(),
                    НомерНакладной = supply.InvoiceNumber
                };
            dataGrid.ItemsSource = items;
        }

        private void MenuItem_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void CommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            HelpWindow helpWindow = new HelpWindow();
            helpWindow.WindowStartupLocation = WindowStartupLocation.CenterScreen;
            helpWindow.Show();
        }

        private void about_Click(object sender, RoutedEventArgs e)
        {
            AboutWindow aboutWindow = new AboutWindow();
            aboutWindow.WindowStartupLocation = WindowStartupLocation.CenterScreen;
            aboutWindow.Show();
        }

        private void query_Click(object sender, RoutedEventArgs e)
        {
            ComboBox comboBox=new ComboBox {Margin = new Thickness(10), Padding = new Thickness(5), Width = 300, SelectedIndex = 0};
            comboBox.SelectionChanged += ComboBox_SelectionChanged;
            comboBox.Items.Add(new ComboBoxItem { Content = "Выберите производителя" });
            foreach (var manufact in context.Manufacturers.ToList())
            {
                comboBox.Items.Add(new ComboBoxItem {Content = manufact.ManufacturerName});
            }
            grid.Children.Add(comboBox);
        }

        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var comboBox = (ComboBox) sender;
            var comboBoxItem=(ComboBoxItem) comboBox.SelectedItem;
            string selected = comboBoxItem.Content.ToString();

            var queriedItems = from items in context.Manufacturers.ToList()
                where items.ManufacturerName == selected
                join medicine in context.Medicines on items.ManufacturerId equals medicine.ManufacturerId
                select new
                {
                    Производитель = selected,
                    Лекарство = medicine.MedicineName
                };
            dataGrid.ItemsSource = queriedItems;
        }

        private void print_Click(object sender, RoutedEventArgs e)
        {
            PrintDialog printDialog=new PrintDialog();

            if (printDialog.ShowDialog().GetValueOrDefault())
            {
                printDialog.PrintVisual(dataGrid, "Печать таблицы");
            }
        }
    }
}