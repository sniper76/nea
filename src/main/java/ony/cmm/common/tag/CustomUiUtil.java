package ony.cmm.common.tag;

public class CustomUiUtil {

	public static String changeFairDivClass(String fairDivCd) {
		String className = "";
		switch (fairDivCd) {
		case "FDC0000000001":
			className = "ncpf";
			break;
		case "FDC0000000002":
			className = "pcpf";
			break;
		case "FDC0000000003":
			className = "ep";
			break;
		case "FDC0000000004":
			className = "mj";
			break;
		case "FDC0000000005":
			className = "rf";
			break;
		case "NDC0000000001":
			className = "training";
			break;
		case "NDC0000000002":
			className = "scholarship";
			break;
		}
		return className;
	}

	public static String changeNewClass(String newYn) {
		String className = "";
		switch (newYn) {
		case "Y":
			className = "new";
			break;
		}
		return className;
	}

}
