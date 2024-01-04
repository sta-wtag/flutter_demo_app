import 'dart:convert';
import 'package:flutter_demo_application/models/genre_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' show Client;
import '../data/data.dart';
import '../models/track_model.dart';
import '../models/profile_model.dart';
import '../models/recommended_model.dart';
import '../models/playlist_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeDataProvider {
  Client client = Client();
  final _apiKey = 'c93ded4914a8a06152d221044163aafe';

  // Future<List<String>> fetchPlayList() async {
  //   try {
  //     return playlists;
  //     // final response = await client.get(Uri.parse(
  //     //     "http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey"));
  //     // if (response.statusCode == 200) {
  //     //   var temp = jsonDecode(response.body);
  //     //   return ItemModel.fromJson(temp);
  //     // } else {
  //     //   throw Exception('Failed to load post');
  //     // }
  //   } catch (error) {
  //     throw Exception(error);
  //   }
  // }

  Future<List<String>> fetchLibrary() async {
    try {
      return Future.delayed(Duration(seconds: 2), () {
        return yourLibrary;
      });

      // final response = await client.get(Uri.parse(
      //     "http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey"));
      // if (response.statusCode == 200) {
      //   var temp = jsonDecode(response.body);
      //   return ItemModel.fromJson(temp);
      // } else {
      //   throw Exception('Failed to load post');
      // }
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<Track> getMyTopFiveTrack() async {
    var token = dotenv.env['TOKEN'];

    try {
      final response = await client.get(
          Uri.parse(
              '${dotenv.env['BASE_URL']}/v1/me/top/tracks?time_range=long_term&limit=5'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });

      if (response.statusCode == 200) {
        var temp = jsonDecode(response.body);
        return Track.fromJson(temp);
      } else {
        throw Exception('Failed to load post');
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<Recommended> getTopFiveRecommandedSongs() async {
    //   return (await fetchWebApi(
    //   `v1/recommendations?limit=5&seed_tracks=${topTracksIds.join(',')}`, 'GET'
    // )).tracks;
    const topTracksIds = [
      '5UHvVfewZKxwoB6gdhSFtr',
      '6yw7Qu0CZ9EaWTRKShnsbG',
      '6kPJZM97LwdG9QIsT7khp6',
      '4K9YS0nkXZMgV0F9JQoirx',
      '4PMmwowVLOajPdiKnrU1vK'
    ];

    var token = dotenv.env['TOKEN'];
    try {
      final response = await client.get(
          Uri.parse(
              "${dotenv.env['BASE_URL']}/v1/recommendations?limit=5&seed_tracks=${topTracksIds.join(',')}"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });

      if (response.statusCode == 200) {
        var temp = jsonDecode(response.body);
        return Recommended.fromJson(temp);
      } else {
        throw Exception('Failed to load post');
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<Playlist> fetchPlaylists() async {
    const tracksUri = [
      'spotify:track:5UHvVfewZKxwoB6gdhSFtr',
      'spotify:track:3WDIhWoRWVcaHdRwMEHkkS',
      'spotify:track:6yw7Qu0CZ9EaWTRKShnsbG',
      'spotify:track:3fS2ITOjddRm069lDr732P',
      'spotify:track:6kPJZM97LwdG9QIsT7khp6',
      'spotify:track:1GIsnE71uUtWvGpvnJCTXO',
      'spotify:track:4K9YS0nkXZMgV0F9JQoirx',
      'spotify:track:6vHflDkQi3aMHoUFPlPCHB',
      'spotify:track:4PMmwowVLOajPdiKnrU1vK',
      'spotify:track:03FPFGGmCFCFX9X7vNB3JW'
    ];
    var profile = await fetchUser();

    var token = dotenv.env['TOKEN'];

    try {
      const params = {
        "name": "My recommendation playlist",
        "description":
            "Playlist created by the tutorial on developer.spotify.com",
        "public": false
      };
      final res = await client.post(
          Uri.parse("https://api.spotify.com/v1/users/${profile.id}/playlists"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: json.encode(params));
      if (res.statusCode == 201) {
        var playlist = Playlist.fromJson(jsonDecode(res.body));
        var response = await client.post(
            Uri.parse(
                "${dotenv.env['BASE_URL']}/v1/playlists/${playlist.id}/tracks?uris=${tracksUri.join(',')}"),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            });
        return playlist;
      } else {
        throw Exception('Failed to load post');
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<Profile> fetchUser() async {
    var token = dotenv.env['TOKEN'];

    try {
      final response = await client
          .get(Uri.parse("${dotenv.env['BASE_URL']}/v1/me"), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        var temp = jsonDecode(response.body);
        return Profile.fromJson(temp);
      } else {
        throw Exception('Failed to load post');
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<Genre> fetchGenres() async {
    var token = dotenv.env['TOKEN'];
    try {
      final response = await client.get(
          Uri.parse(
              "${dotenv.env['BASE_URL']}/v1/recommendations/available-genre-seeds"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });
      if (response.statusCode == 200) {
        var temp = jsonDecode(response.body);

        return Genre.fromJson(temp);
      } else {
        throw Exception('Failed to load post');
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
