import 'package:flutter/material.dart';
import 'package:tektok/app/utils/common/logger_util.dart';
import 'package:tektok/app/utils/constant/filter_constant.dart';

import 'package:tektok/app/utils/styles/theme_style.dart';
import 'package:tektok/presentation/components/customs/custom_button.dart';
import 'package:tektok/presentation/components/customs/custom_dropdown_button.dart';
import 'package:tektok/presentation/components/customs/custom_radio_button.dart';
import 'package:tektok/presentation/components/customs/custom_text_box.dart';

class CustomFiltering extends StatefulWidget {
  final dynamic parent;
  final dynamic assetClasses;
  final FilterType filterType;
  final List<GeneralFilter>? customFilters;

  const CustomFiltering({
    Key? key,
    required this.parent,
    this.assetClasses,
    this.filterType = FilterType.general,
    this.customFilters,
  }) : super(key: key);

  @override
  State<CustomFiltering> createState() => _CustomFilteringState();
}

class _CustomFilteringState extends State<CustomFiltering> {
  final searchController = TextEditingController();
  List<GeneralFilter> gotoFilters = <GeneralFilter>[];
  GeneralFilter? selectedGoto;
  List<GeneralFilter> sortByFilters = <GeneralFilter>[];
  GeneralFilter? selectedSortBy;
  final sortType = <SortType>[
    SortType.asc,
    SortType.desc,
  ];
  SortType selectedSortType = SortType.asc;
  bool openFilter = false;
  bool useFilter = false;

  @override
  void initState() {
    if (!widget.parent.useFilter.value) {
      openFilter = false;
      useFilter = false;
      setState(() {});
    }
    super.initState();
    doInitialFilter(widget.filterType, widget.customFilters);
  }

  @override
  void didUpdateWidget(CustomFiltering oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  doResetFilter() {
    useFilter = false;
    selectedGoto = null;
    selectedSortBy = null;
    searchController.clear();

    if (widget.parent != null) {
      widget.parent.useFilter.value = false;
      widget.parent.goto.value = null;
      widget.parent.sortBy.value = null;
      widget.parent.sortType.value = null;
      widget.parent.searchQuery.value = null;
      widget.parent.update();
    }

    setState(() {});
  }

  doInitialFilter(FilterType filterType, List<GeneralFilter>? customFilters) {
    switch (filterType) {
      case FilterType.general:
        doInitGeneralFilter();
        break;
      case FilterType.custom:
        doInitCustomFilter(customFilters ?? []);
        break;
      default:
        null;
    }
    if (widget.parent.useFilter.value) {
      selectedGoto = widget.parent.goto.value ?? sortByFilters.first;
      selectedSortBy = widget.parent.sortBy.value ?? sortByFilters.first;
      selectedSortType = widget.parent.sortType.value ?? sortType.first;
      searchController.text = widget.parent.searchQuery.value;
    }
    setState(() {});
  }

  doInitCustomFilter(List<GeneralFilter> customFilters) {
    gotoFilters = customFilters;
    sortByFilters = customFilters;
    setState(() {});
  }

  doInitGeneralFilter() {
    gotoFilters = [
      GeneralFilter.number,
      GeneralFilter.description,
      GeneralFilter.state,
      // GeneralFilter.createdDate,
    ];
    sortByFilters = [
      GeneralFilter.number,
      GeneralFilter.description,
      GeneralFilter.state,
      // GeneralFilter.createdDate,
    ];
    setState(() {});
  }

  doGetLabel(GeneralFilter? filter) {
    if (filter != null) {
      return GeneralFilter.values
          .firstWhere((element) => element.name == filter.name)
          .label;
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    // data filter builder
    Widget dataFilterBuilder() {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: layoutStyle.defaultMargin,
              vertical: layoutStyle.defaultMargin / 2,
            ),
            child: Row(
              children: [
                CustomButton(
                  onPressed: () {
                    openFilter = !openFilter;
                    setState(() {});
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.resolveWith(
                      (states) => EdgeInsets.zero,
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => colorStyle.white,
                    ),
                    overlayColor: MaterialStateProperty.resolveWith(
                      (states) => colorStyle.black.withOpacity(0.1),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          layoutStyle.defaultMargin / 2,
                        ),
                        side: BorderSide(color: colorStyle.black),
                      ),
                    ),
                  ),
                  label: SizedBox(
                    height: layoutStyle.blockVertical * 3.5,
                    width: layoutStyle.blockVertical * 3.5,
                    // child: Image.asset(
                    //   assets.icOpenDataFilter,
                    //   fit: BoxFit.contain,
                    // ),
                  ),
                  height: layoutStyle.blockVertical * 6.5,
                  width: layoutStyle.blockVertical * 6.5,
                ),
                SizedBox(
                  width: layoutStyle.defaultMargin,
                ),
                Expanded(
                  child: CustomTextBox(
                    height: layoutStyle.blockVertical * 6.5,
                    obscureText: false,
                    borderRadius: BorderRadius.circular(
                      layoutStyle.defaultMargin * 10,
                    ),
                    border: Border.all(
                      color: colorStyle.black,
                      width: 1,
                    ),
                    onChanged: (value) {
                      if (widget.parent != null) {
                        widget.parent.useFilter.value = true;
                        widget.parent.searchQuery.value = value;
                        widget.parent.update();
                      }
                    },
                    controller: searchController,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          if (widget.parent != null) {
                            logger.safeLog(widget.assetClasses);
                            if (widget.assetClasses != null) {
                              widget.parent.doPrepareList(
                                page: 1,
                                classes: widget.assetClasses,
                              );
                            } else {
                              widget.parent.doPrepareList(page: 1);
                            }
                          }
                        },
                        // child: Image.asset(
                        //   assets.icSearch,
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      suffixIconConstraints: BoxConstraints(
                        maxHeight: layoutStyle.blockHorizontal * 6.5,
                      ),
                      hintText: 'Search',
                      hintStyle: textStyle.greyText,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  width: layoutStyle.defaultMargin,
                ),
                CustomButton(
                  onPressed: () {
                    doResetFilter();
                    if (widget.assetClasses != null) {
                      widget.parent
                          .doPrepareList(page: 1, classes: widget.assetClasses);
                    } else {
                      widget.parent.doPrepareList(page: 1);
                    }
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.resolveWith(
                      (states) => EdgeInsets.zero,
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => colorStyle.white,
                    ),
                    overlayColor: MaterialStateProperty.resolveWith(
                      (states) => colorStyle.black.withOpacity(0.1),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          layoutStyle.defaultMargin / 2,
                        ),
                        side: BorderSide(color: colorStyle.yellow),
                      ),
                    ),
                  ),
                  label: SizedBox(
                    height: layoutStyle.blockVertical * 3.5,
                    width: layoutStyle.blockVertical * 3.5,
                    child: Icon(
                      Icons.refresh_rounded,
                      color: colorStyle.yellow,
                    ),
                  ),
                  height: layoutStyle.blockVertical * 6.5,
                  width: layoutStyle.blockVertical * 6.5,
                ),
              ],
            ),
          ),
        ],
      );
    }
    // end builder

    // data filter body builder
    Widget dataFilterBodyBuilder() {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        transform: Matrix4.identity()..scale(openFilter ? 1.0 : .4),
        transformAlignment: Alignment.topCenter,
        curve: Curves.easeIn,
        width: layoutStyle.screenWidth,
        padding: EdgeInsets.symmetric(
          vertical: layoutStyle.defaultMargin / 3,
        ),
        constraints: BoxConstraints(
          maxHeight: openFilter ? layoutStyle.blockVertical * 26 : 0,
        ),
        child: Column(
          children: [
            CustomDropdownButton(
              height: layoutStyle.blockVertical * 6.5,
              items: gotoFilters
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        doGetLabel(e),
                      ),
                    ),
                  )
                  .toList(),
              value: selectedGoto,
              hint: Text(
                'Go To',
                style: textStyle.greyText,
              ),
              border: Border.all(
                color: colorStyle.grey,
                width: 1,
              ),
              margin: EdgeInsets.symmetric(
                vertical: layoutStyle.defaultMargin / 2,
                horizontal: layoutStyle.defaultMargin,
              ),
              onChanged: (value) {
                selectedGoto = value;
                if (value != GeneralFilter.none || selectedSortBy != null) {
                  useFilter = true;
                } else {
                  useFilter = false;
                }

                if (widget.parent != null) {
                  widget.parent.goto.value = value;
                  widget.parent.update();
                }

                setState(() {});
              },
            ),
            CustomDropdownButton(
              height: layoutStyle.blockVertical * 6.5,
              items: sortByFilters
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        doGetLabel(e),
                      ),
                    ),
                  )
                  .toList(),
              value: selectedSortBy,
              hint: Text(
                'Sort By',
                style: textStyle.greyText,
              ),
              border: Border.all(
                color: colorStyle.grey,
                width: 1,
              ),
              margin: EdgeInsets.symmetric(
                vertical: layoutStyle.defaultMargin / 2,
                horizontal: layoutStyle.defaultMargin,
              ),
              onChanged: (value) {
                selectedSortBy = value ?? GeneralFilter.none;
                if (value != GeneralFilter.none || selectedGoto != null) {
                  useFilter = true;
                } else {
                  useFilter = false;
                }

                if (widget.parent != null) {
                  widget.parent.sortBy.value = value;
                  widget.parent.update();
                }

                setState(() {});
              },
            ),
            CustomRadioButton(
              direction: Axis.horizontal,
              groupValue: selectedSortType,
              items: sortType,
              onChanged: (value) {
                selectedSortType = value ?? SortType.asc;
                setState(() {});

                if (widget.parent != null) {
                  widget.parent.sortType.value = value;
                  widget.parent.update();
                }
              },
            ),
          ],
        ),
      );
    }
    // end builder

    // selected filter builder
    Widget selectedFilterBuilder() {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: layoutStyle.defaultMargin,
          vertical: layoutStyle.defaultMargin / 2,
        ),
        child: Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    (selectedGoto != null && selectedGoto != GeneralFilter.none)
                        ? Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(
                                    layoutStyle.defaultMargin / 3),
                                decoration: BoxDecoration(
                                  color: colorStyle.cloud_blue,
                                  borderRadius: BorderRadius.circular(
                                    layoutStyle.defaultMargin / 2,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Go to:',
                                      style: textStyle.greyText.copyWith(
                                        fontSize: fontSize.small,
                                      ),
                                    ),
                                    SizedBox(
                                      width: layoutStyle.defaultMargin / 3,
                                    ),
                                    Text(
                                      doGetLabel(selectedGoto),
                                      style: textStyle.blackText.copyWith(
                                        fontSize: fontSize.small,
                                        fontWeight: fontWeight.semiBold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: layoutStyle.defaultMargin / 2,
                              ),
                            ],
                          )
                        : Container(),
                    (selectedSortBy != null &&
                            selectedSortBy != GeneralFilter.none)
                        ? Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(
                                    layoutStyle.defaultMargin / 3),
                                decoration: BoxDecoration(
                                  color: colorStyle.cloud_blue,
                                  borderRadius: BorderRadius.circular(
                                    layoutStyle.defaultMargin / 2,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Sort by:',
                                      style: textStyle.greyText.copyWith(
                                        fontSize: fontSize.small,
                                      ),
                                    ),
                                    SizedBox(
                                      width: layoutStyle.defaultMargin / 3,
                                    ),
                                    Text(
                                      doGetLabel(selectedSortBy),
                                      style: textStyle.blackText.copyWith(
                                        fontSize: fontSize.small,
                                        fontWeight: fontWeight.semiBold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: layoutStyle.defaultMargin / 2,
                              ),
                            ],
                          )
                        : Container(),
                    Container(
                      padding: EdgeInsets.all(layoutStyle.defaultMargin / 3),
                      decoration: BoxDecoration(
                        color: colorStyle.cloud_blue,
                        borderRadius: BorderRadius.circular(
                          layoutStyle.defaultMargin / 2,
                        ),
                      ),
                      child: Text(
                        selectedSortType.label,
                        style: textStyle.blackText.copyWith(
                          fontSize: fontSize.small,
                          fontWeight: fontWeight.semiBold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: layoutStyle.defaultMargin / 3,
            ),
            InkWell(
              onTap: () {
                doResetFilter();
              },
              child: Container(
                padding: EdgeInsets.all(layoutStyle.defaultMargin / 10),
                decoration: BoxDecoration(
                  color: colorStyle.red,
                  borderRadius: BorderRadius.circular(
                    layoutStyle.blockHorizontal * 10,
                  ),
                ),
                child: Icon(
                  Icons.close,
                  color: colorStyle.white,
                ),
              ),
            ),
          ],
        ),
      );
    }
    // end builder

    return Column(
      children: [
        dataFilterBuilder(),
        useFilter ? selectedFilterBuilder() : Container(),
        dataFilterBodyBuilder(),
      ],
    );
  }
}
