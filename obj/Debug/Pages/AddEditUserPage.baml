   M S B A M L   `   `   `  ����G  CToysStoreApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ToysStoreApp.PagesToysStoreApp.Pages  5      (    "ToysStoreApp.Pages.AddEditUserPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:ToysStoreApp.Pages     5        N� Title$  AddEditUserPage��5	      .��5      �  � RowDefinitions 5   
   �� 5      �� 5      �� 5      �� 5      �� 5      �� 5       � ColumnDefinitions 5   
   �� 5      $	��250 �6   �� 5      .+�5   
   �� $)��#Логин пользователя��6   �� 5   
   -   5         ��Name$ txtBoxLogin��5   "   $��1��6   ��67   �� *Login+�� 5   
   $��1��6   $+��%Пароль пользователя��6!   �� 5   
   -   5        $ txtBoxPassword��5   /   $��1��6   $��1��6"   ��6G   �� *
Password+�� 5   
   $��2��6   $%��Тип пользователя��6!   �� 5   
   -   5         ��Name$ comboBoxTypeId��5   0   $��1��6   $��2��6#    �� DisplayMemberPath$ ID��6l    �� SelectedItem 6H   �� *
TypeOfUser+6l   �� 5   
   $��3��6   $��Код работника��6!   �� 5   
   -   5        $ comboBoxWorkerId��5   0   $��1��6   $��3��6#   $ ID��6l    6J   �� *
WorkerId+6l   �� 5    
   $��4��6   $��Код клиента��6!   �� 5!   
   -   5        $ comboBoxClientId��5!   0   $��1��6   $��4��6#   $ ID��6d    �� Text 6J   �� *
ClientId+6d   �� 5"   
   -   5         ��Name$ btnSave��5"   B   $��1��6   $��5��6!   $��Сохранить��6.   6S   5#      5$      