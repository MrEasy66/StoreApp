   M S B A M L   `   `   `  ����G  CToysStoreApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ToysStoreApp.PagesToysStoreApp.Pages  5      "    ToysStoreApp.Pages.UsersPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:ToysStoreApp.Pages     5        N� Title$  	UsersPage��5	      .��5      �  � RowDefinitions 5   
   �� 5      $��70 �6   �� 5      �� 5      $��30 �6   .+�5   
   �� .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� $��Поиск: ��6   $
��Left=�6+   $	��Top=�6F   $��18(�6^   �� 5      -   5         ��Name$ 	searchBox��5      $��49 0 0 0q�6-   $
��Left=�6?   $	��Top=�6Z   6r   5      �� 5      $ 
Horizontal=�6   $��0 5 0 0q�62   .+�5      �� $��Сортировка: ��6   $��Bottom=�60   $
��Left=�6K   $��18(�6f   �� 5      -   5         ��Name$ 	filterBox��5      $��2 0 0 0q�6.   $	��250��6?   $��30��6K   6W   5      5      &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ 	usersGrid��5       $��1��6      AutoGenerateColumns .     
IsReadOnly . $��0 10 0 0q�6a      Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn	   Header$	 
Логин��6%   
   Width5  /System.Windows.Controls.DataGridLengthConverter$
 * 6N   1  +System.Windows.Controls.DataGridBoundColumn   Binding 64   �� *Login+6N     5      $	 Пароль��6%   $
 * 6R    65   �� *
Password+6R     5      $%	 Тип пользователя��6%   $
 * 6Z    6?   �� *TypeId+6Z     5       $	 ID работника��6%   $
 * 6X    6;   �� *
WorkerId+6X     5!      $	 ID клиента��6%   $
 * 6V    69   �� *
ClientId+6V   4  .System.Windows.Controls.DataGridTemplateColumn  5"      $
 * 6)      CellTemplate 5#      �� 5$      .R�5%      �� $��BtnEdit��6=   -   5        $ ��Редактировать��5%   %   6d   5&      5(      5*      �� 5+   
   -   5         ��Name$ btnAdd��5+   L   $��2��6   $��Добавить��6   $
��Left=�61   6\   �� 5,   
   -   5        $ 	btnDelete��5,   L   $��2��6   $��Удалить��6   $��Right=�60   6_   5-      5.      