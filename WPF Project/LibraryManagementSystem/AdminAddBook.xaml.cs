using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using LibraryMSWF.BL;
using Microsoft.Win32;
using Path = System.IO.Path;

namespace LibraryManagementSystem
{
    /// <summary>
    /// Interaction logic for AdminAddBook.xaml
    /// </summary>
    public partial class AdminAddBook : Window
    {
        //khởi tạo biến để lưu đường dẫn hình ảnh
        public string bookImage = "";
        public AdminAddBook()
        {
            InitializeComponent();
        }
        //ADD THE BOOKS DETAILS INTO BOOK TABEL =>PL
        private void BtnSubmit_Click(object sender, RoutedEventArgs e)
        {
            // mainguyen nút nhấn save

            // mainguyen kiểm tra rổng
            if (tbBName.Text != string.Empty && tbBAuthor.Text != string.Empty && tbBISBN.Text != string.Empty && tbBPrice.Text != string.Empty &&
                tbBCopy.Text != string.Empty
                )
            {
                try
                {
                    // mainguyen gọi qua controller
                    BookBL bookBL = new BookBL();
                    string isDone = bookBL.AddBookBL(tbBName.Text, tbBAuthor.Text, tbBISBN.Text, double.Parse(tbBPrice.Text), int.Parse(tbBCopy.Text), this.bookImage);
                    if (isDone == "true")
                    {
                        MessageBox.Show("Book added successfuly..");
                        this.Close();
                    }
                    else
                    {
                        MessageBox.Show(isDone + "Try again..");
                    }
                }
                catch (FormatException)
                {
                    MessageBox.Show("Invalid Book price or Book copy!!!,\nThey should not be a string, Try again..");
                }
                catch (Exception)
                {
                    MessageBox.Show("Some unknown exception is occured!!!, Try again..");
                }
            }
            else
            {
                MessageBox.Show("Enter the fields properly!!!, Every field is required..");
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                //lưu thông tin hình sách
                OpenFileDialog dialog = new OpenFileDialog();
                dialog.Filter = "Image files|*.bmp;*.jpg;*.png;";
                dialog.FilterIndex = 1;
                if (dialog.ShowDialog() == true)
                {
                    imagePicture.Source = new BitmapImage(new Uri(dialog.FileName));
                    string path = Path.Combine(@"~\images");
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }
                    var fileName = System.IO.Path.GetFileName(dialog.FileName);
                    path = path + "\\" + fileName;
                    File.Copy(dialog.FileName, path);

                    //gán đường dẫn hình ảnh vào biến tạm > để khi nhấn save lấy để lưu vào database
                    this.bookImage = path;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
