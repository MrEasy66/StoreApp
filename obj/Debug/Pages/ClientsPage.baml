   M S B A M L   `   `   `  ����G  CToysStoreApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:ToysStoreAppToysStoreApp  5          ToysStoreApp.ClientsPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ,localclr-namespace:ToysStoreApp     5        N� Title$  ClientsPage��5	      .��5      �  � RowDefinitions 5   
   �� 5      $��70 �6   �� 5      �� 5      $��30 �6   .+�5   
   �� .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� $��Поиск: ��6   $
��Left=�6'   $	��Top=�6B   $��18(�6Z   �� 5      -   5         ��Name$ 	searchBox��5      $��49 0 0 0q�6)   $
��Left=�6;   $	��Top=�6V   6n   5      �� 5   
   $ 
Horizontal=�6   $��0 5 0 0q�6.   .+�5      �� $��Сортировка: ��6   $��Bottom=�6,   $
��Left=�6G   $��18(�6b   �� 5      -   5         ��Name$ 	filterBox��5      $��2 0 0 0q�6*   $	��250��6;   $��30��6G   6S   5      5      &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ clientsGrid��5       $��1��6      AutoGenerateColumns .     
IsReadOnly . $��0 10 0 0q�6c      Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn	   Header$	 Имя��6%   
   Width5  /System.Windows.Controls.DataGridLengthConverter$
 * 6K   1  +System.Windows.Controls.DataGridBoundColumn   Binding 62   �� *Name+6K     5      $	 Фамилия��6%   $
 * 6R    66   �� *	Surname+6R   4  .System.Windows.Controls.DataGridTemplateColumn  5      $
 * 6)      CellTemplate 5       �� 5!      .R�5"      �� $��BtnEdit��6=   -   5        $ ��Редактировать��5"   %   6d   5#      5%      5'      �� 5(   
   -   5         ��Name$ btnAdd��5(   L   $��2��6   $��Добавить��6   $
��Left=�61   6\   �� 5)   
   -   5        $ 	btnDelete��5)   L   $��2��6   $��Удалить��6   $��Right=�60   6_   5*      5+      