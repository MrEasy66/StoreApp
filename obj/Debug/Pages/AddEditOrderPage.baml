   M S B A M L   `   `   `  ����G  CToysStoreApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:ToysStoreAppToysStoreApp  5      ` \EntityFramework.SqlServer, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089nMclr-namespace:System.Data.Entity.SqlServer;assembly=EntityFramework.SqlServerSystem.Data.Entity.SqlServer 5      #    ToysStoreApp.AddEditOrderPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ,localclr-namespace:ToysStoreApp     5      c	SqlServerMclr-namespace:System.Data.Entity.SqlServer;assembly=EntityFramework.SqlServer     5        N� Title$  AddEditOrderPage��5
      .��5      �  � RowDefinitions 5   
   �� 5      �� 5      �� 5      �� 5      �� 5       � ColumnDefinitions 5   
   �� 5      $	��200 �6   �� 5      .+�5   
   �� $��ID Клиента��6   �� 5   
   -   5         ��Name$ comboBoxClientId��5   #   $��1��6    �� DisplayMemberPath$ ID��6]    �� SelectedItem 6=   �� *Client+6]   �� 5   
   $��ID Товара��6   $��1��6%   �� 5   
   -   5        $ comboBoxProductId��5   0   $��1��6   $��1��6    $ ID��6l    6K   �� *	Product+6l   �� 5   
   $��2��6   $'��!Количество товара��6!   �� 5   
   -   5         ��Name$ txtBoxProductCount��5   0   $��1��6L   $��2��6\   ��6   �� *ProductCount+6i   �� 5   
   $��3��6   $%��Стоимость заказа��6!   �� 5   
   -   5        $ txtBoxOrderPrice��5   .   $��1��6H   $��3��6X   ��6   �� *
OrderPrice+6e   �� 5    
   -   5         ��Name$ btnSave��5    B   $��1��6   $��4��6!   $��Сохранить��6.   6S   5!      5"      