//
//  NetworkResponses.swift
//  Unbabel ChallengeTests
//
//  Created by Luís Rosa on 06/09/2019.
//  Copyright © 2019 Luís Rosa. All rights reserved.
//

import Foundation

enum NetworkResponses: String {
    case posts = """
    [
{
userId: 1,
id: 1,
title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
body: "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto"
},
{
userId: 1,
id: 2,
title: "qui est esse",
body: "est rerum tempore vitae sequi sint nihil reprehenderit dolor beatae ea dolores neque fugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis qui aperiam non debitis possimus qui neque nisi nulla"
},
{
userId: 1,
id: 3,
title: "ea molestias quasi exercitationem repellat qui ipsa sit aut",
body: "et iusto sed quo iure voluptatem occaecati omnis eligendi aut ad voluptatem doloribus vel accusantium quis pariatur molestiae porro eius odio et labore et velit aut"
},
{
userId: 1,
id: 4,
title: "eum et est occaecati",
body: "ullam et saepe reiciendis voluptatem adipisci sit amet autem assumenda provident rerum culpa quis hic commodi nesciunt rem tenetur doloremque ipsam iure quis sunt voluptatem rerum illo velit"
}
]
"""
    case users = """
[
{
id: 1,
name: "Leanne Graham",
username: "Bret",
email: "Sincere@april.biz",
address: {
street: "Kulas Light",
suite: "Apt. 556",
city: "Gwenborough",
zipcode: "92998-3874",
geo: {
lat: "-37.3159",
lng: "81.1496"
}
},
phone: "1-770-736-8031 x56442",
website: "hildegard.org",
company: {
name: "Romaguera-Crona",
catchPhrase: "Multi-layered client-server neural-net",
bs: "harness real-time e-markets"
}
},
{
id: 2,
name: "Ervin Howell",
username: "Antonette",
email: "Shanna@melissa.tv",
address: {
street: "Victor Plains",
suite: "Suite 879",
city: "Wisokyburgh",
zipcode: "90566-7771",
geo: {
lat: "-43.9509",
lng: "-34.4618"
}
},
phone: "010-692-6593 x09125",
website: "anastasia.net",
company: {
name: "Deckow-Crist",
catchPhrase: "Proactive didactic contingency",
bs: "synergize scalable supply-chains"
}
},
{
id: 3,
name: "Clementine Bauch",
username: "Samantha",
email: "Nathan@yesenia.net",
address: {
street: "Douglas Extension",
suite: "Suite 847",
city: "McKenziehaven",
zipcode: "59590-4157",
geo: {
lat: "-68.6102",
lng: "-47.0653"
}
},
phone: "1-463-123-4447",
website: "ramiro.info",
company: {
name: "Romaguera-Jacobson",
catchPhrase: "Face to face bifurcated interface",
bs: "e-enable strategic applications"
}
},
{
id: 4,
name: "Patricia Lebsack",
username: "Karianne",
email: "Julianne.OConner@kory.org",
address: {
street: "Hoeger Mall",
suite: "Apt. 692",
city: "South Elvis",
zipcode: "53919-4257",
geo: {
lat: "29.4572",
lng: "-164.2990"
}
}
]
"""
    case comments = """
    [
    {
    postId: 1,
    id: 1,
    name: "id labore ex et quam laborum",
    email: "Eliseo@gardner.biz",
    body: "laudantium enim quasi est quidem magnam voluptate ipsam eos tempora quo necessitatibus dolor quam autem quasi reiciendis et nam sapiente accusantium"
    },
    {
    postId: 1,
    id: 2,
    name: "quo vero reiciendis velit similique earum",
    email: "Jayne_Kuhic@sydney.com",
    body: "est natus enim nihil est dolore omnis voluptatem numquam et omnis occaecati quod ullam at voluptatem error expedita pariatur nihil sint nostrum voluptatem reiciendis et"
    },
    {
    postId: 1,
    id: 3,
    name: "odio adipisci rerum aut animi",
    email: "Nikita@garfield.biz",
    body: "quia molestiae reprehenderit quasi aspernatur aut expedita occaecati aliquam eveniet laudantium omnis quibusdam delectus saepe quia accusamus maiores nam est cum et ducimus et vero voluptates excepturi deleniti ratione"
    },
    {
    postId: 1,
    id: 4,
    name: "alias odio sit",
    email: "Lew@alysha.tv",
    body: "non et atque occaecati deserunt quas accusantium unde odit nobis qui voluptatem quia voluptas consequuntur itaque dolor et qui rerum deleniti ut occaecati"
    }
    ]
"""
}

