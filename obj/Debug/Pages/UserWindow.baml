   M S B A M L   `   `   `  ����G  CToysStoreApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:ToysStoreAppToysStoreApp  5   	       ToysStoreApp.UserWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ,localclr-namespace:ToysStoreApp     5   	     � Title$  
UserWindow��5   	   $	��450��6   $	��490��6,   $	��800��69   $	��800��6H    � WindowStartupLocation$ CenterScreen=�6T   .��5	      �  � ColumnDefinitions 5
   
   �� 5      $	��200 �6   �� 5      $��* �6   .+�5   
   � $��0��6    � RowDefinitions 5      �� 5      �� 5      �� 5      .+�5      �� $��/Resources/StoreLogo.png��6   �� 5      
����� �$��1��6/   .+�5      �� -   5         ��Name$ 
btnHistory��5      $��История входа��6-   6E   �� 5      -   5        $ btnUsers��5      $��0 10 0 0q�6+   $��Пользователи��6=   6T   �� 5      -   5        $ 
btnClients��5      $��0 10 0 0q�6-   $��Клиенты��6?   6Q   �� 5      -   5        $ 	btnOrders��5      $��	0 10 0 10q�6,   $��Заказы��6?   6P   5      �� 5      
����� �$��2��6/   .+�5      �� -   5        $ btnOffer��5      $��Предложения��6+   6A   �� 5      -   5        $ 
btnProduct��5      $��0 10 0 0q�6-   $��
Товар��6?   6O   �� 5      -   5        $ btnBack��5      $��0 10 0 0q�6*   $��
Назад��6<   6L   �� 5      -   5        $ btnExit��5      $��0 10 0 0q�6*   $��
Выход��6<   6L   5       5!       � 5"   
   -	   5          �Name$ 	mainFrame��5"        � NavigationUIVisibility$ Hidden=�6#   $��1��6C   6S   5#      5$      