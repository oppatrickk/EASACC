enum CustomIconData {
  recent('assets/icons/clock-02.svg'),
  theme('assets/icons/paint-bucket.svg'),
  language('assets/icons/language-circle.svg'),
  edit('assets/icons/pencil-edit-02.svg'),
  devices('assets/icons/smart-phone-04.svg'),
  url('assets/icons/link-02.svg'),
  noUrl('assets/icons/unlink-04.svg'),
  settings('assets/icons/setting-07.svg'),
  arrowLeft('assets/icons/arrow-left-02.svg'),
  arrowRight('assets/icons/arrow-right-02.svg'),
  chevronRight('assets/icons/arrow-right-01.svg'),
  chevronLeft('assets/icons/arrow-left-01.svg'),
  chevronDown('assets/icons/arrow-down-01.svg');

  const CustomIconData(this.assetLocation);
  final String assetLocation;
}
