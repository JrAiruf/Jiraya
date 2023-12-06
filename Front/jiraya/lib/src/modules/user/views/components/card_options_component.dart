// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CardOptionsComponent extends StatefulWidget {
  const CardOptionsComponent({
    Key? key,
    this.height,
    this.onTap,
    this.width,
    this.backgroundColor,
    this.title,
    this.content,
    required this.image,
  }) : super(key: key);

  final double? height;
  final Function()? onTap;
  final double? width;
  final Color? backgroundColor;
  final String? title;
  final String? content;
  final AssetImage image;

  @override
  State<CardOptionsComponent> createState() => _CardOptionsComponentState();
}

class _CardOptionsComponentState extends State<CardOptionsComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        color: widget.backgroundColor,
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            height: widget.height,
            width: widget.width,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title ?? "",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      widget.content ?? "",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: widget.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                    height: 65,
                    width: 65,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
