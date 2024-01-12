<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Payments Page</title>

 <link rel="stylesheet" href="{{ asset('/forum/assets/forum.css?v=045dd903') }}">
<link rel="preload" href="{{ asset('/forum/assets/forum.css?v=045dd903') }}" as="style">


<link rel="preload" href="{{ asset('/forum/assets/fonts/fa-solid-900.woff2') }}" as="font" type="font/woff2" crossorigin="">
<link rel="preload" href="{{ asset('/forum/assets/fonts/fa-regular-400.woff2') }}" as="font" type="font/woff2" crossorigin="">
    <!-- CSS only -->
    <link
      href="{{ asset('/admin_page/css/bootstrap-icons-1.9.1/bootstrap-icons.css') }}"
      rel="stylesheet"
    />
	<link
      href="{{ asset('/admin_page/css/fontawesome-free-6.2.0-web/css/all.css') }}"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="{{ asset('/admin_page/css/bootstrap3.3.5.css') }}"
    />
    <link rel="stylesheet" href="{{ asset('/admin_page/css/style.css') }}" />
	<link rel="stylesheet" href="{{ asset('/admin_page/css/style_total.css') }}" />
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
	<main class="App-content"  onfocusin="hideMenu()">
   <div class="wrapper">
      <!-- Sidebar Holder -->
    <nav id="sidebar">
        <div class="sidebar-header" id="sidebar-title">
          <h3><i class="bi bi-envelope-paper-heart-fill"></i> Admin Page</h3>
          <strong><i class="bi bi-list"></i></strong>
        </div>

        <ul class="list-unstyled components">
          <li class="">
            <a href="{{route('game-admin')}}">
              <i class="bi bi-house"></i>
              Home
            </a>
          </li>
          <li class="active">
            <a href="{{route('admin-game1')}}">
              <i class="bi bi-image"></i>
              Game 1
            </a>
          </li>
          <li class="">
            <a href="{{route('admin-game2')}}">
              <i class="bi bi-clipboard"></i>
              Game 2
            </a>
          </li>
		  <li class="">
            <a href="{{route('admin-payments')}}">
              <i class="bi bi-cash-coin"></i>
              Payments
            </a>
          </li>
        </ul>
      </nav>

      <!-- Page Content Holder -->
      <div id="content">
        <div class="container">
          <!-- Page Content  -->
          <!-- Gay -->
          <div id="content-main" class="">
            <div class="container-fluid">
              <div><h2>Payments</h2></div>
            </div>
            <div class="container-input-text" id="main">
              <div class="form-group active">
                <div class="col-lg-2 text-center align-items-center"></div>
                <div class="col-lg-2 text-center">
                  <label
                    for="input-type"
                    style="font-weight: bold; font-size: 1.2em"
                    >Input quantity credit</label
                  >
                </div>
                <div class="col-lg-2 text-center">
                  <label
                    for="input-type"
                    style="font-weight: bold; font-size: 1.2em"
                    >Input cost</label
                  >
                </div>
              </div>
              <div class="form-group col-lg-12 col-sm-12">
                <div class="col-lg-2 text-center">
                  <label
                    for="input-type"
                    style="font-weight: bold; font-size: 1.6em"
                    >Credit 1</label
                  >
                </div>
                <div class="col-lg-2">
                  <input
                    type=""
                    min="0"
                    class="form-control input-number"
                    id="quantity-credit1"
                    placeholder="Input quatity credit"
                  />
                </div>
                <div class="col-lg-2">
                  <input
                    type=""
                    min="0"
                    class="form-control input-number"
                    id="cost-credit1"
                    placeholder="Input cost"
                  />
                </div>
              </div>
              <div class="form-group col-lg-12">
                <div class="col-lg-2 text-center align-items-center">
                  <label
                    for="input-type"
                    style="font-weight: bold; font-size: 1.6em"
                    >Credit 2</label
                  >
                </div>

                <div class="col-lg-2">
                  <input
                    type=""
                    min="0"
                    class="form-control input-number"
                    id="quantity-credit2"
                    placeholder="Input quatity credit"
                  />
                </div>
                <div class="col-lg-2">
                  <input
                    type=""
                    min="0"
                    class="form-control input-number"
                    id="cost-credit2"
                    placeholder="Input cost"
                  />
                </div>
              </div>
              <div class="form-group col-lg-12">
                <div class="col-lg-2 text-center align-items-center">
                  <label
                    for="input-type"
                    style="font-weight: bold; font-size: 1.6em"
                    >Credit 3</label
                  >
                </div>
                <div class="col-lg-2">
                  <input
                    type=""
                    min="0"
                    class="form-control input-number"
                    id="quantity-credit3"
                    placeholder="Input quatity credit"
                  />
                </div>
                <div class="col-lg-2">
                  <input
                    type=""
                    min="0"
                    class="form-control input-number"
                    id="cost-credit3"
                    placeholder="Input cost"
                  />
                </div>
              </div>
              <div class="form-group col-lg-12">
                <div class="col-lg-2 text-center align-items-center">
                  <label
                    for="input-type"
                    style="font-weight: bold; font-size: 1.6em"
                    >Credit 4</label
                  >
                </div>

                <div class="col-lg-2">
                  <input
                    type=""
                    min="0"
                    class="form-control input-number"
                    id="quantity-credit4"
                    placeholder="Input quatity credit"
                    style="display: block"
                  />
                </div>
                <div class="col-lg-2">
                  <input
                    type=""
                    min="0"
                    class="form-control input-number"
                    id="cost-credit4"
                    placeholder="Input cost"
                    style="display: block"
                  />
                </div>
              </div>
              <div class="form-group col-lg-12">
                <div class="col-lg-2 text-center align-items-center">
                  <label
                    for="input-type"
                    style="font-weight: bold; font-size: 1.6em"
                    >Credit 5</label
                  >
                </div>

                <div class="col-lg-2">
                  <input
                    type=""
                    min="0"
                    class="form-control input-number"
                    id="quantity-credit5"
                    placeholder="Input quatity credit"
                    style="display: block"
                  />
                </div>
                <div class="col-lg-2">
                  <input
                    type=""
                    min="0"
                    class="form-control input-number"
                    id="cost-credit5"
                    placeholder="Input cost"
                    style="display: block"
                  />
                </div>
              </div>
              <div class="form-group col-lg-12">
                <div class="col-lg-2 text-center align-items-center">
                  <label
                    for="input-type"
                    style="font-weight: bold; font-size: 1.6em"
                    >Credit 6</label
                  >
                </div>

                <div class="col-lg-2">
                  <input
                    type=""
                    min="0"
                    class="form-control input-number"
                    id="quantity-credit6"
                    placeholder="Input quatity credit"
                    style="display: block"
                  />
                </div>
                <div class="col-lg-2">
                  <input
                    type=""
                    min="0"
                    class="form-control input-number"
                    id="cost-credit6"
                    placeholder="Input cost"
                    style="display: block"
                  />
                </div>
              </div>
              <div class="form-group col-lg-12">
                <div class="col-lg-2 text-center align-items-center"></div>

                <div class="col-lg-9">
                  <button
                    type="button"
                    class="btn btn-primary btn-credit"
                    id="submit-btn"
                    style="margin: 10px 0% 10px 0%"
                  >
                    Submit Credit
                  </button>
                </div>
              </div>

              <!-- input text -->
              <div
                class="row justify-content-center align-items-center mt-4"
                id="container-form"
              ></div>
            </div>
          </div>
        </div>

        <!-- UI Pay Page Demo   -->
        <div id="pay-container">
          <div class="main-container">
            <section class="container-decription">
              <h2>Chọn gói Credit phù hợp - Hiện tại</h2>
            </section>
            <section class="container-credits">
              <div class="container-credit">
                <div class="container-credit-text">
                    <div class="paymoney-text-credit">
                      <h1 id="credit-1">15</h1>
                      <p>Mins</p>
                    </div>
                    <p id="pay-credit-1">300,000d</p>
                </div>
                <div class="paymoney-link">
                  <p id="pay-per-credit1">20,000 vnd/credit</p>
                  <i id="save-text-credit1" style="opacity: 0">Tiet kiem ?</i>
                  <a  id="credit1-link" href="#" target="_blank"  rel="noopener noreferrer">Chọn</a>
                </div>
              </div>
              <div class="container-credit">
                <div class="container-credit-text">
                    <div class="paymoney-text-credit">
                      <h1 id="credit-2">#</h1>
                      <p>Mins</p>
                    </div>
                    <p id="pay-credit-2">#</p>
                </div>
                <div class="paymoney-link">
                  <p id="pay-per-credit2">#</p>
                  <i id="save-text-credit2">#</i>
                  <a  id="credit2-link" href="#" target="_blank"  rel="noopener noreferrer">Chọn</a>
                </div>
              </div>
              <div class="container-credit">
                <div class="container-credit-text popular">
                    <div class="paymoney-text-credit">
                      <h1 id="credit-3">#</h1>
                      <p>Mins</p>
                    </div>
                    <p id="pay-credit-3">#</p>
                </div>
                <div class="paymoney-link">
                  <p id="pay-per-credit3">#</p>
                  <i id="save-text-credit3">#</i>
                  <a  id="credit3-link" href="#" target="_blank"  rel="noopener noreferrer">Chọn</a>
                </div>
              </div>
              <div class="container-credit">
                <div class="container-credit-text">
                    <div class="paymoney-text-credit">
                      <h1 id="credit-4">#</h1>
                      <p>Mins</p>
                    </div>
                    <p id="pay-credit-4">#</p>
                </div>
                <div class="paymoney-link">
                  <p id="pay-per-credit4">#</p>
                  <i id="save-text-credit4">#</i>
                  <a  id="credit4-link" href="#" target="_blank"  rel="noopener noreferrer">Chọn</a>
                </div>
              </div>
              <div class="container-credit">
                <div class="container-credit-text">
                    <div class="paymoney-text-credit">
                      <h1 id="credit-5">#</h1>
                      <p>Mins</p>
                    </div>
                    <p id="pay-credit-5">#</p>
                </div>
                <div class="paymoney-link">
                  <p id="pay-per-credit5">#</p>
                  <i id="save-text-credit5" style="color: rgb(202, 92, 13)"
                    >#</i
                  >

                  <a  id="credit5-link" href="#" target="_blank"  rel="noopener noreferrer">Chọn</a>
                </div>
              </div>
              <div class="container-credit">
                <div class="container-credit-text">
                    <div class="paymoney-text-credit">
                      <h1 id="credit-6">#</h1>
                      <p>Mins</p>
                    </div>
                    <p id="pay-credit-6">#</p>
                </div>
                <div class="paymoney-link">
                  <p id="pay-per-credit6">#</p>
                  <i id="save-text-credit6" style="color: rgb(202, 92, 13)"
                    >#</i
                  >
                  <a  id="credit6-link" href="#" target="_blank"  rel="noopener noreferrer">Chọn</a>
                </div>
              </div>
            </section>
          </div>
        </div>
      </div>
    </div>
	</main>
</div>
    <!-- JavaScript Bundle with Popper -->
    <script src="{{ asset('/admin_page/js/storage.js') }}"></script>
    <script type="module" src="{{ asset('/admin_page/js/UIPay.js') }}"></script>
    <script type="module" src="{{ asset('/admin_page/js/payments.js') }}"></script>
    <script src="{{ asset('/admin_page/js/jquery.js') }}"></script>
    <script src="{{ asset('/admin_page/js/cleave.js-master/dist/cleave.min.js') }}"></script>
    <!-- <script src="../js/cleave.js-master/dist/cleave.min.js"></script> -->
    <script>
      var cleave = new Cleave(".input-thousand", {
        // block: [3, 3, 3, 3],
        // delimeter: ",",
        numeral: true,
        numeralThousandsGroupStyle: "thousand",
      });
    </script>
	 <script  type="module" src="{{ asset('/admin_page/js/header.js') }}"></script>
 
  </body>
</html>