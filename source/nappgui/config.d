module nappgui.config;

version (NAppGUI_NoAsserts) {
	enum NAppGUI_NoAsserts = true;
}
else {
	enum NAppGUI_NoAsserts = false;
}

mixin template ExpandEnum(EnumType, string fqnEnumType = EnumType.stringof) {
	static foreach (m; __traits(allMembers, EnumType)) {
		mixin("alias " ~ m ~ " = " ~ fqnEnumType ~ "." ~ m ~ ";");
	}
}



