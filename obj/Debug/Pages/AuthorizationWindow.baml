   M S B A M L   `   `   `  ����G  CToysStoreApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:ToysStoreAppToysStoreApp  5   	   &     ToysStoreApp.AuthorizationWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ,localclr-namespace:ToysStoreApp     5   	     � Title$  AuthorizationWindow��5   	   $	��450��6%   $	��400��62   
����� � � WindowStartupLocation$ CenterScreen=�6T   .��5	      �  � RowDefinitions 5
   
   �� 5      $��50��6   $��70��6+   �� 5      $��90��6   $	��130��6+   �� 5      $��90��6   $	��130��6+   �� 5      $��50��6   $��70��6+   .+�5   
   �� $��Авторизация��6   �� 5   
   $��Введите логин��6   $��1��6)   $	��Top=�66   �� 5   
   -   5         ��Name$ loginBox��5      $��1��6   6   �� 5   
   $��2��6   $!��Введите пароль��6!   $	��Top=�67   G� 5   
   -   5         G�Name$ passwordBox��5   #   $��2��6   6#   �� 5   
   -   5        $��pwdBox��5      $��2��6   $y�Hidden=�6-   �� 5   
   -   5         ��Name$ pwdChBox��5   ;   $��2��6   $��Bottom=�6    $#��Показать пароль��6M   6g   �� 5   
   -   5         ��Name$ btnLogin��5      $��3��6#   $��
Войти��60   6@   5      5      