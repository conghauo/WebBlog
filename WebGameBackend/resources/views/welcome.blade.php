<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"  />
    <title>Home Game Page</title>
    
    <!-- style -->
     <link rel="stylesheet" href="{{ asset('/forum/assets/forum.css?v=045dd903') }}">
<link rel="preload" href="{{ asset('/forum/assets/forum.css?v=045dd903') }}" as="style">


<link rel="preload" href="{{ asset('/forum/assets/fonts/fa-solid-900.woff2') }}" as="font" type="font/woff2" crossorigin="">
<link rel="preload" href="{{ asset('/forum/assets/fonts/fa-regular-400.woff2') }}" as="font" type="font/woff2" crossorigin="">
    <link rel="stylesheet" href="{{ asset('/admin_page/css/style_total.css') }}" />

    <!-- google fonts -->
    <link
      href="https://fonts.googleapis.com/css2?family=Oleo+Script&family=Sigmar+One&display=swap"
      rel="stylesheet"
    />
    <link
      href="//db.onlinewebfonts.com/c/ecb721d7a029bf6c7cce4e57ddf20952?family=Chevin+Eco"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Sigmar+One&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
<div id="app" class="App affix BlogOverviewPage " aria-hidden="false">

    <div id="app-navigation" class="App-navigation"><div class="Navigation ButtonGroup App-backControl"><button onfocusin="showMenu()" class="Button Button--icon Navigation-drawer hasIcon" type="button" aria-label="Mở ngăn điều hướng"><i aria-hidden="true" class="icon fas fa-bars Button-icon"></i><span class="Button-label"></span></button></div></div>
   <div id="drawer" class="App-drawer"  >
        <header id="header" class="App-header navbar-fixed-top">
            <div id="header-navigation" class="Header-navigation"><div class="Navigation ButtonGroup "></div></div>
            <div class="container">
                <h1 class="Header-title">
                    <a href="{{ asset('/forum') }}" id="home-link">
                                                    <img src="http://192.168.1.81/forum/assets/logo-euvhdhxb.png" alt="hunbae" class="Header-logo">
                                            </a>
                </h1>
                <div id="header-primary" class="Header-primary ButtonGroup"><button class="Dropdown-toggle Button"><span aria-hidden="true"id="Times" class="Button-icon">10 mins 25 secs </span></button> </div>

		<div id="header-secondary" class="Header-secondary"><ul class="Header-controls"><li class="item-search"> 
	<div role="search" aria-label="Tìm kiếm trên diễn đàn" class="Search"><div class="Search-input"></div><ul class="Dropdown-menu Search-results" aria-hidden="" style="max-height: 249px;"></ul></div></li><li class="item-locale"><div class="ButtonGroup Dropdown dropdown  Dropdown--select itemCount2"><ul class="Dropdown-menu dropdown-menu "><li class=""><button class="hasIcon" type="button" active=""><span class="Button-label">Tiếng Việt</span></button></li><li class=""><button class="hasIcon" type="button"><span class="Button-label">English</span></button></li></ul></div></li><li class="item-flags"><div class="ButtonGroup Dropdown dropdown NotificationsDropdown itemCount0"><div class="Dropdown-menu Dropdown-menu--right"></div></div></li><li class="item-notifications"><div class="ButtonGroup Dropdown dropdown NotificationsDropdown itemCount0"><div class="Dropdown-menu Dropdown-menu--right"></div></div></li><li class="item-session"><div class="ButtonGroup Dropdown dropdown SessionDropdown itemCount5"><button class="Dropdown-toggle Button Button--user Button--flat" aria-haspopup="menu" aria-label="Chuyển đổi menu thả xuống tùy chọn phiên" data-toggle="dropdown" aria-expanded="false"><span class="Avatar " id="Avatar" loading="lazy" style="--avatar-bg: #a0e5c3;">C</span> <span class="Button-label"><span class="username"id="username" >conghauAdmin</span></span></button><ul class="Dropdown-menu dropdown-menu Dropdown-menu--right"><li class="item-profile"><a id="hasIcon" class="hasIcon" href="/forum/u/conghauAdmin" active="false"><i aria-hidden="true" class="icon fas fa-user Button-icon"></i><span class="Button-label">Trang cá nhân</span></a></li><li class="item-settings"><a class="hasIcon" href="/payment" active="false"><i aria-hidden="true" class="icon fas fa-cog Button-icon"></i><span class="Button-label"> Thanh Toán</span></a></li><li class="item-administration"><a class="hasIcon" href="/game-admin" target="_blank" active="false"><i aria-hidden="true" class="icon fas fa-wrench Button-icon"></i><span class="Button-label">Trang quản trị</span></a></li><li class="Dropdown-separator"></li><li class="item-logOut"><button class="hasIcon" type="button"><i aria-hidden="true" class="icon fas fa-sign-out-alt Button-icon"></i><span class="Button-label">Đăng xuất</span></button></li></ul></div></li></ul></div>
            </div>
        </header>
    </div>
 <main class="App-content">
    <div id="home-container">
      <div class="home-main">
        <section class="main-games">
          <div class="main-game game-1">
            <div class="name-game">
              <h2>THÍCH XẾP HÌNH KHONG ANH</h2>
            </div>
            <div class="img-game">
              <img src="{{ asset('/admin_page/img/game1.png') }}" alt="img-game1" />
            </div>
            <div class="select-option">
              <select id="select-game1">
                <option value="">&nbsp;</option>
                <option value="1">GAY</option>
                <option value="2">LES</option>
                <option value="3">Normal</option>
                <option value="4">3Some</option>
              </select>
            </div>

            <div class="play-game">
              <a href="/game1" id="link-game1">CHƠI NGAY</a>
            </div>
          </div>
          <div class="main-game game-1">
            <div class="name-game"><h2>THÍCH THẬT THÁCH</h2></div>
            <div class="img-game">
              <img src="{{ asset('/admin_page/img/game2.png') }}" alt="img-game2" />
            </div>
            <div class="select-option">
              <select id="select-game2">
                <option value="">&nbsp;</option>
                <option value="1">LEVEL 1</option>
                <option value="2">LEVEL 2</option>
                <option value="3">LEVEL 3</option>
              </select>
            </div>

            <div class="play-game">
              <a href="/game2" id="link-game2">CHƠI NGAY</a>
            </div>
          </div>
        </section>
      </div>
    </div>
	</main>
</div>
	 <!-- JavaScript Bundle with Popper -->
  <script  src="{{ asset('/admin_page/js/jquery-3.6.1.min.js') }}"></script>
  <script  type="module" src="{{ asset('/admin_page/js/header.js') }}"></script>
 
</body>
</html>