class Movie {
  int id;
  String title;
  String date;
  String poster;
  String backdrop;
  String overview;
  double voteAvg;

  Movie({
    required this.id,
    required this.title,
    required this.date,
    required this.poster,
    required this.backdrop,
    required this.overview,
    required this.voteAvg,
  });
}

var movieList = [
  Movie(
    id: 379686,
    title: "Space Jam: A New Legacy",
    date: "2021-07-08",
    poster: "/5bFK5d3mVTAvBCXi5NPWH0tYjKl.jpg",
    backdrop: "/x0qhpQ0GwBEjAdb7hPchQDevBvQ.jpg",
    overview:
        "When LeBron and his young son Dom are trapped in a digital space by a rogue A.I., LeBron must get them home safe by leading Bugs, Lola Bunny and the whole gang of notoriously undisciplined Looney Tunes to victory over the A.I.'s digitized champions on the court. It's Tunes versus Goons in the highest-stakes challenge of his life.",
    voteAvg: 7.8,
  ),
  Movie(
    id: 497698,
    title: "Black Widow",
    date: "2021-07-07",
    poster: "/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg",
    backdrop: "/dq18nCTTLpy9PmtzZI6Y2yAgdw5.jpg",
    overview:
        "Natasha Romanoff, also known as Black Widow, confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.",
    voteAvg: 8.0,
  ),
  Movie(
    id: 602223,
    title: "The Forever Purge",
    date: "2021-06-30",
    poster: "/uHA5COgDzcxjpYSHHulrKVl6ByL.jpg",
    backdrop: "/zLx0VxpzJt3E0cb4GodV10Wp0Lt.jpg",
    overview:
        "All the rules are broken as a sect of lawless marauders decides that the annual Purge does not stop at daybreak and instead should never end as they chase a group of immigrants who they want to punish because of their harsh historical past.",
    voteAvg: 7.9,
  ),
  Movie(
    id: 459151,
    title: "The Boss Baby: Family Business",
    date: "2021-07-01",
    poster: "/5dExO5G2iaaTxYnLIFKLWofDzyI.jpg",
    backdrop: "/n2opkcFxIGc0plZJs45CAH8IjiF.jpg",
    overview:
        "The Templeton brothers — Tim and his Boss Baby little bro Ted — have become adults and drifted away from each other. But a new boss baby with a cutting-edge approach and a can-do attitude is about to bring them together again … and inspire a new family business.",
    voteAvg: 7.9,
  ),
  Movie(
    id: 588228,
    title: "The Tomorrow War",
    date: "2021-06-30",
    poster: "/34nDCQZwaEvsy4CFO5hkGRFDCVU.jpg",
    backdrop: "/yKSNSOwHOeiZv2DxwHAlpiEXBB4.jpg",
    overview:
        "The world is stunned when a group of time travelers arrive from the year 2051 to deliver an urgent message: Thirty years in the future, mankind is losing a global war against a deadly alien species. The only hope for survival is for soldiers and civilians from the present to be transported to the future and join the fight. Among those recruited is high school teacher and family man Dan Forester. Determined to save the world for his young daughter, Dan teams up with a brilliant scientist and his estranged father in a desperate quest to rewrite the fate of the planet.",
    voteAvg: 8.3,
  ),
  Movie(
    id: 508943,
    title: "Luca",
    date: "2021-06-17",
    poster: "/jTswp6KyDYKtvC52GbHagrZbGvD.jpg",
    backdrop: "/620hnMVLu6RSZW6a5rwO8gqpt0t.jpg",
    overview:
        "Luca and his best friend Alberto experience an unforgettable summer on the Italian Riviera. But all the fun is threatened by a deeply-held secret: they are sea monsters from another world just below the water’s surface.",
    voteAvg: 8.1,
  ),
  Movie(
    id: 615658,
    title: "Awake",
    date: "2021-06-09",
    poster: "/1OTa0PfX2axMY8f9tFRSzESUgkC.jpg",
    backdrop: "/3RMbkXS4ocMmoJyAD3ZsWbm32Kx.jpg",
    overview:
        "After a sudden global event wipes out all electronics and takes away humankind’s ability to sleep, chaos quickly begins to consume the world. Only Jill, an ex-soldier with a troubled past, may hold the key to a cure in the form of her own daughter. The question is, can Jill safely deliver her daughter and save the world before she herself loses her mind.",
    voteAvg: 6.1,
  ),
  Movie(
    id: 581726,
    title: "Infinite",
    date: "2021-06-10",
    poster: "/niw2AKHz6XmwiRMLWaoyAOAti0G.jpg",
    backdrop: "/wjQXZTlFM3PVEUmKf1sUajjygqT.jpg",
    overview:
        "Evan McCauley has skills he never learned and memories of places he has never visited. Self-medicated and on the brink of a mental breakdown, a secret group that call themselves “Infinites” come to his rescue, revealing that his memories are real.",
    voteAvg: 7.3,
  ),
  Movie(
    id: 385128,
    title: "F9",
    date: "2021-05-19",
    poster: "/bOFaAXmWWXC3Rbv4u4uM9ZSzRXP.jpg",
    backdrop: "/xXHZeb1yhJvnSHPzZDqee0zfMb6.jpg",
    overview:
        "Dominic Toretto and his crew battle the most skilled assassin and high-performance driver they've ever encountered: his forsaken brother.",
    voteAvg: 7.5,
  ),
  Movie(
    id: 637649,
    title: "Wrath of Man",
    date: "2021-04-22",
    poster: "/M7SUK85sKjaStg4TKhlAVyGlz3.jpg",
    backdrop: "/77tui163estZrQ78NBggqDB4n2C.jpg",
    overview:
        "A cold and mysterious new security guard for a Los Angeles cash truck company surprises his co-workers when he unleashes precision skills during a heist. The crew is left wondering who he is and where he came from. Soon, the marksman's ultimate motive becomes clear as he takes dramatic and irrevocable steps to settle a score.",
    voteAvg: 7.8,
  ),
  Movie(
    id: 834404,
    title: "Teen Titans Go! See Space Jam",
    date: "2021-06-20",
    poster: "/j0pJ7e2ZGdzo9yEV7c6TLBue8Co.jpg",
    backdrop: "/x9p2syPxeK2OYCpz35fsg0EFjlG.jpg",
    overview:
        "The Teen Titans are visited by the Nerdlucks, the Space Jam villains who tried to capture Michael Jordan and the Looney Tunes. Astonished to discover his fellow Titans have never seen Space Jam, Cyborg organizes an exclusive watch party. Of course, if the Titans are watching a movie, don't expect silence to be golden. Raven and Starfire provide the commentary, Cyborg presents the fun facts, Beast Boy points out the butt shots, and Robin, but Robin doesn't trust their new alien friends. Are the Nerdlucks here to attend an innocent watch party, or do they have more sinister motives up their sleeves?",
    voteAvg: 7.3,
  ),
  Movie(
    id: 522478,
    title: "Peter Rabbit 2: The Runaway",
    date: "2021-03-25",
    poster: "/cycDz68DtTjJrDJ1fV8EBq2Xdpb.jpg",
    backdrop: "/5HjzYTihkH7EvOWSE7KcsF6pBMM.jpg",
    overview:
        "Bea, Thomas, and the rabbits have created a makeshift family, but despite his best efforts, Peter can’t seem to shake his mischievous reputation. Adventuring out of the garden, Peter finds himself in a world where his mischief is appreciated, but when his family risks everything to come looking for him, Peter must figure out what kind of bunny he wants to be.",
    voteAvg: 7.4,
  ),
];
