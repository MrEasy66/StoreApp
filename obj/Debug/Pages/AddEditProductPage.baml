   M S B A M L   `   `   `  ����G  CToysStoreApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ToysStoreApp.PagesToysStoreApp.Pages  5      +    %ToysStoreApp.Pages.AddEditProductPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:ToysStoreApp.Pages     5        N� Title$  AddEditProductPage��5	      .��5      �  � RowDefinitions 5   
   �� 5      �� 5      �� 5      �� 5       � ColumnDefinitions 5   
   �� 5      $	��200 �6   �� 5      .+�5   
   �� $#��Название товара��6   �� 5   
   -   5         ��Name$ 
txtBoxName��5   "   $��1��6   ��66   �� *Name+�� 5   
   $��1��6   $ ��Производитель��6!   �� 5   
   -   5        $ txtBoxManufacturer��5   /   $��1��6   $��1��6   ��6K   �� *Manufacturer+�� 5   
   $��2��6   $��Цена товара��6!   �� 5   
   -   5        $ 
txtBoxCost��5   /   $��2��6   $��1��6   ��6C   �� *Cost+6Y   �� 5   
   -   5         ��Name$ btnSave��5   B   $��3��6   $��1��6   $��Сохранить��6.   6S   5      5      