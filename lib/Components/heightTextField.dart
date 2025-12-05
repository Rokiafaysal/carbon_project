import 'package:flutter/material.dart';

class NumberInputWidget extends StatefulWidget {
  final String label;
  final int initialValue;
  final bool isVisible;

  const NumberInputWidget({super.key, 
    required this.label,
    this.initialValue = 0,
    this.isVisible = true, required TextEditingController controller,
  });

  @override
  _NumberInputWidgetState createState() => _NumberInputWidgetState();
}

class _NumberInputWidgetState extends State<NumberInputWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue.toString());
  }

  void incrementValue() {
    setState(() {
      int value = int.tryParse(_controller.text) ?? widget.initialValue;
      value++;
      _controller.text = value.toString();
    });
  }

  void decrementValue() {
    setState(() {
      int value = int.tryParse(_controller.text) ?? widget.initialValue;
      if (value > 0) {
        value--;
        _controller.text = value.toString();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

      double mywidth = MediaQuery.of(context).size.width;
      double myheight= MediaQuery.of(context).size.height;
    if (!widget.isVisible) {
      return const SizedBox.shrink(); // Hide the widget if isVisible is false
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          widget.label,
          style: const TextStyle(fontSize: 14,color: Color(0xff393939)),
        ),
        Padding(
          padding:  EdgeInsets.only(top: myheight*0.007),
          child: Container(
             width: mywidth*(336/393),
             height: myheight*(48/853),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              
              children: [
               
                const SizedBox(width: 10),
                SizedBox(
                  width: mywidth*(50/393),
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    onSubmitted: (value) {
                      setState(() {
                        int parsedValue = int.tryParse(value) ?? widget.initialValue;
                        _controller.text = parsedValue.toString();
                      });
                    },
                  ),
                ),
            
                Padding(
                  padding:  EdgeInsets.only(left: mywidth*0.41),
                  child: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: decrementValue,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: incrementValue,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}