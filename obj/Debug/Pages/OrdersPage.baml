   M S B A M L   `   `   `  ����G  CToysStoreApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:ToysStoreAppToysStoreApp  5          ToysStoreApp.OrdersPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ,localclr-namespace:ToysStoreApp     5        N� Title$  
OrdersPage��5	      .��5      �  � RowDefinitions 5   
   �� 5      $��70 �6   �� 5      �� 5      $��30 �6   .+�5   
   �� $��Сортировка: ��6   $��Center=�6(   $
��Left=�6C   $��18(�6^   �� 5      -   5         ��Name$ 	filterBox��5      $��Center=�6.   $
��Left=�6I   $��	110 0 0 0q�6d   $	��250��6w   $��30��6�   6�   �� 5      -   5         ��Name$ btnPrint��5      $��Right=�6'   $��Center=�6C   $��Печать��6^   6o   &   System.Windows.Controls.DataGrid  5      -   5          Name$ 
ordersGrid��5   $   $��1��6      AutoGenerateColumns .     
IsReadOnly .    Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ ID��6%   	   Width5  /System.Windows.Controls.DataGridLengthConverter$	 * 6H   1  +System.Windows.Controls.DataGridBoundColumn
   Binding
 61   �� *ID+6H     5      $ ID Клиента��6%   $	 * 6V   
 69   �� *
ClientId+6V     5      $ ID Товара��6%   $	 * 6V   
 68   �� *	ProductId+6V     5      $' !Количество товара��6%   $	 * 6a   
 6@   �� *ProductCount+6a     5      $% Стоимость заказа��6%   $	 * 6^   
 6?   �� *
OrderPrice+6^   4  .System.Windows.Controls.DataGridTemplateColumn  5      $	 * 6)      CellTemplate 5      �� 5      .R�5      �� $��btnEdit��6=   -   5        $ ��Редактировать��5   %   6d   5      5!      5#      �� 5$   
   -   5        $ btnAdd��5$   L   $��2��6   $��Добавить��6   $
��Left=�61   6\   �� 5%   
   -   5        $ 	btnDelete��5%   L   $��2��6   $��Удалить��6   $��Right=�60   6_   5&      5'      