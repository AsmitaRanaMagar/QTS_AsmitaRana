<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="QTS_By_Asmita.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .hero {
            position: relative;
            overflow: hidden;
            min-height: 65vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            border-radius: 12px;
            padding: 3rem 1.5rem;
            margin-top: 0;
            box-shadow: 0 10px 30px rgba(0,0,0,0.6);
            background: #000; /* fallback */
        }
        .hero::before {
            content: '';
            position: absolute;
            inset: 0;
            /* use a mild dark gradient over the image and reduce blur so image is more visible */
            background: linear-gradient(rgba(0,0,0,0.35), rgba(0,0,0,0.35)), url('Assets/Images/herosection.jpg') no-repeat center center / cover;
            filter: blur(4px) saturate(0.95);
            transform: scale(1.02);
            z-index: 1;
        }
        .hero-inner { position: relative; z-index: 2; max-width: 900px; text-align: center; padding: 1rem; }
        .hero h1 { font-size: 2.25rem; font-weight: 800; letter-spacing: -0.02em; margin:0; color:#fff }
        .hero p { color: rgba(255,255,255,0.92); margin-top: .75rem; font-size: 1.05rem; }
        .cta { margin-top: 1.25rem; display:flex; gap:0.75rem; flex-wrap:wrap; justify-content:center; }
        /* Primary button */
        .btn-primary-custom,
        .btn-primary-custom:visited {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: .5rem;
            background: linear-gradient(180deg, #F0C95A 0%, #D4AF37 100%);
            color: #07120b; /* dark text for contrast */
            padding: .65rem 1.1rem;
            border-radius: .6rem;
            font-weight: 700;
            box-shadow: 0 8px 22px rgba(212,175,55,0.14), inset 0 -4px 8px rgba(0,0,0,0.12);
            border: 0;
            text-decoration: none;
            transition: transform .18s ease, box-shadow .18s ease, opacity .18s ease;
            cursor: pointer;
        }
        .btn-primary-custom:hover,
        .btn-primary-custom:focus {
            transform: translateY(-3px);
            box-shadow: 0 18px 40px rgba(212,175,55,0.18), inset 0 -3px 6px rgba(0,0,0,0.08);
            outline: none;
            text-decoration: none;
            opacity: 0.98;
        }
        .btn-primary-custom:active {
            transform: translateY(0);
            box-shadow: 0 6px 14px rgba(0,0,0,0.5);
        }

        /* Outline button */
        .btn-outline-custom,
        .btn-outline-custom:visited {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: .5rem;
            background: rgba(0,0,0,0.35);
            color: #D4AF37;
            padding: .55rem 1rem;
            border-radius: .6rem;
            border: 1px solid rgba(212,175,55,0.28);
            font-weight: 600;
            text-decoration: none;
            transition: background .18s ease, transform .18s ease, color .18s ease, box-shadow .18s ease;
            cursor: pointer;
        }
        .btn-outline-custom:hover,
        .btn-outline-custom:focus {
            background: linear-gradient(180deg, rgba(212,175,55,0.12), rgba(212,175,55,0.06));
            color: #000;
            transform: translateY(-3px);
            box-shadow: 0 12px 30px rgba(212,175,55,0.08);
            outline: none;
        }
        .btn-outline-custom:active {
            transform: translateY(0);
            box-shadow: none;
        }

        /* Ensure anchors don't get default link styles inside hero */
        .hero a { text-decoration: none; }

        .feature { background: rgba(255,255,255,0.02); padding: 1.25rem; border-radius: 8px; }
        .movie-card { background: rgba(255,255,255,0.02); border-radius: 8px; overflow: hidden; }
        .movie-card .meta { padding: .75rem; }
        @media (min-width: 768px) {
            .hero h1 { font-size: 3rem; }
            .hero { min-height: 72vh }
            /* keep text centered on larger viewports for balanced composition */
            .hero-inner { text-align: center; transform: none; }
            .cta { justify-content: center }
        }
    </style>

    <section class="hero mx-auto max-w-7xl rounded-lg">
        <div class="hero-inner">
            <h1 class="home-title">Welcome to Quick Cinema Hall</h1>
            <p style="margin-top: .75rem; font-size: 1.05rem; color: rgba(255,255,255,0.92);">
                Experience movies the way they were meant to be seen — comfortable halls, crystal-clear sound and seamless booking. Find showtimes, pick seats and get instant tickets.
            </p>
            <div class="cta">
                <asp:HyperLink runat="server" NavigateUrl="~/Movies" CssClass="btn-primary-custom">Browse Movies</asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/Shows" CssClass="btn-outline-custom">View Shows</asp:HyperLink>
                <asp:Button ID="btnGetStarted" runat="server" Text="Get Started" CssClass="btn-primary-custom" PostBackUrl="~/Customer.aspx" />
            </div>
        </div>
    </section>

    <section class="max-w-7xl mx-auto mt-10 px-2">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div class="feature">
                <h3 class="text-lg font-bold gold-text">Easy Booking</h3>
                <p class="text-sm mt-2">Select seats, choose shows and pay securely — all in a few clicks.</p>
            </div>
            <div class="feature">
                <h3 class="text-lg font-bold gold-text">Best Halls</h3>
                <p class="text-sm mt-2">We list top halls with comfortable seating and excellent sound and visuals.</p>
            </div>
            <div class="feature">
                <h3 class="text-lg font-bold gold-text">Exclusive Offers</h3>
                <p class="text-sm mt-2">Get discounts and special combos when you book through our portal.</p>
            </div>
        </div>
    </section>

    <section class="max-w-7xl mx-auto mt-12 px-2">
        <div class="flex items-center justify-between mb-4">
            <h2 class="text-2xl font-bold">Now Showing</h2>
            <asp:HyperLink runat="server" NavigateUrl="~/Movies" CssClass="gold-text">See all movies</asp:HyperLink>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
            <!-- Example static movie cards. Replace with dynamic data later. -->
            <div class="movie-card">
                <img src="Assets/Images/movie1.jpg" alt="Movie 1" />
                <div class="meta">
                    <div class="font-bold">Sample Movie 1</div>
                    <div class="text-sm text-gray-400">2h 10m · Action</div>
                </div>
            </div>

            <div class="movie-card">
                <img src="Assets/Images/movie2.jpg" alt="Movie 2" />
                <div class="meta">
                    <div class="font-bold">Sample Movie 2</div>
                    <div class="text-sm text-gray-400">1h 50m · Drama</div>
                </div>
            </div>

            <div class="movie-card">
                <img src="Assets/Images/movie3.jpg" alt="Movie 3" />
                <div class="meta">
                    <div class="font-bold">Sample Movie 3</div>
                    <div class="text-sm text-gray-400">2h 5m · Comedy</div>
                </div>
            </div>

            <div class="movie-card">
                <img src="Assets/Images/movie4.jpg" alt="Movie 4" />
                <div class="meta">
                    <div class="font-bold">Sample Movie 4</div>
                    <div class="text-sm text-gray-400">1h 45m · Romance</div>
                </div>
            </div>
        </div>
    </section>

    <section class="max-w-7xl mx-auto mt-12 mb-12 px-2 text-center">
        <h3 class="text-xl font-bold">Ready to book?</h3>
        <p class="mt-2 text-gray-300">Create an account or sign in to manage your bookings and view tickets.</p>
        <div class="mt-4 flex items-center justify-center gap-3">
            <asp:HyperLink runat="server" NavigateUrl="~/Customer" CssClass="btn-primary-custom">Sign up / Sign in</asp:HyperLink>
            <asp:HyperLink runat="server" NavigateUrl="~/Tickets" CssClass="btn-outline-custom">My Tickets</asp:HyperLink>
        </div>
    </section>

</asp:Content>
