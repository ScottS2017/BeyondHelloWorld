import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Beyond Hello World',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			home: MyHomePage(title: 'Beyond Hello World'),
		);
	}
}

class MyHomePage extends StatefulWidget {
	MyHomePage({Key key, this.title}) : super(key: key);
	final String title;

	@override
	_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
	int _counter = 0;


	/// /////////////////////////////////////////////////////////
	/// This does more than just increment a counter.
	/// setState() will do what it's told in between the
	/// braces and then, once done, rebuild the state
	/// object. This in turn rebuilds the elements of
	/// the UI, so the UI gets updated.
	///
	/// FYI: In dart we don't use public or private. Instead
	/// we put an underscore in front of the variable or function
	/// name and this causes it to be marked as private. So
	/// here, _incrementCounter() is private.
	void _incrementCounter() {

		/// When you're first learning to read setState functions it
		/// can help to imagine there's an unwritten "with" that is part
		/// of the function name. It's kind of like when you add the words
		/// "in bed" whenever you read a fortune cookie, but not as much
		/// fun.
		///
		/// Here, it would read "setStateWith _counter++;"
		setState(() {
			_counter++;

			/// It's easy to understand when you can read the words that aren't
			/// really there!
		});
	}

	/// ////////////////////////////////////////////////////////


	/// This method is run first when createState is run, then it's rerun every time setState is called.
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text(widget.title),
			),


			/// The Orientation builder allows us to track the screen orientation and build our UI using if statements (outside of the build functions) or ternary operators (inside of the build functions) to decide what widgets to use based on the situation.


			body: OrientationBuilder(
				builder: (context, orientation) {

					/// Use different Widget trees depending on if the count is over or under 10.

					if (_counter < 11) {
						return Center(child: UiForUnder10(counter: _counter, orientation: orientation,));
					} else {
						return Center(
							child: UiForOver10(
								counter: _counter,
								orientation: orientation,
							),
						);
					}
				}
			),


			/// Ye old FAB... need I say more?
			floatingActionButton: FloatingActionButton(
				onPressed: _incrementCounter,
				tooltip: 'Increment',


				/// Icons are so easy to use... and look at the cool list right here!
				child: Icon(Icons.add),

			),

			/// Trailing commas after every closing parenthesis ')' help the formatter keep things nested and easy to read. If you leave them out, the formatter starts putting things on one line and stretching that line out to the right.
		);
	}
}

/// This Widget tree is only called if the count is ten or less... obviously.
class UiForUnder10 extends StatelessWidget {
	const UiForUnder10({
		Key key,
		@required this.counter,
		@required this.orientation,
	}) : super(key: key);

	final Orientation orientation;
	final int counter;

	@override
	Widget build(BuildContext context) {

		/// Containers are relatively expensive. Don't over use them. They have built in code for handling color, size, alignments and more. If all you need to do is make a box of a certain size then use a sized box. Flutter is high performance enough that you can get away with being sloppy and using expensive widgets when simpler ones would have been enough but that's not an excuse for being sloppy. One day you may be working on something complicated enough that you'll have to know how to optimize; so you may as well learn it right from the beginning.

		return Container(

			/// double.infinity is Flutter speak for "match_parent"
			width: double.infinity,
			height: double.infinity,

			/// Determine our background color based on the orientation of the device
			color: orientation == Orientation.portrait ?
			Colors.white :
			Colors.black,

			child: Column(


				/// A column's main axis is vertical. It's cross axis is horizontal.
				mainAxisAlignment: MainAxisAlignment.center,

				/// Columns can have an unlimited number of children.
				children: <Widget>[

					/// A Center will center your content both horizontally and vertically
					Center(
						child: Text(

							/// Determine what our text will say based on orientation. We're inside of a build method so a standard if isn't going to work here. We have to use the ternary.
							orientation == Orientation.portrait
								? 'You have pushed the\nbutton this many times:'
								: 'Why does the world look sideways?',

							/// Determine the text color and size based on orientation
							style: TextStyle(

								color: orientation == Orientation.portrait ?
								Colors.black :
								Colors.white,

								fontSize: orientation == Orientation.portrait ?
								18.0 :
								32.0),
						),
					),

					///Same thing...
					Text(
						orientation == Orientation.portrait ?
						'$counter' :
						'(and the counter is at $counter, by the way)',
						style:
						TextStyle(

							color: orientation == Orientation.portrait ?
							Colors.black :
							Colors.white,

							fontSize: orientation == Orientation.portrait ?
							32.0 :
							18.0,
						),
					),
				],
			),
		);
	}
}


/// And this is what most production Flutter classes will look like once you take out all of the "training wheels" comments:

class UiForOver10 extends StatelessWidget {
	const UiForOver10({
		Key key,
		@required this.counter,
		@required this.orientation,
	}) : super(key: key);

	final Orientation orientation;
	final int counter;

	@override
	Widget build(BuildContext context) {
		return Container(
			width: double.infinity,
			height: double.infinity,
			color: orientation == Orientation.portrait ?
			Colors.blue :
			Colors.red,
			child: Center(
				child: Text(
					orientation == Orientation.portrait
						? "Come on man,\nyou're gonna wear me out!"
						: "Are you having fun?\nBecause you're beginning to annoy me...",
					style: TextStyle(
						color: orientation == Orientation.portrait ?
						Colors.yellow :
						Colors.white,
						fontSize: orientation == Orientation.portrait ? 32.0 :
						32.0),
				),
			),
		);
	}
}

// https://github.com/ScottS2017/beyond_hello_world
