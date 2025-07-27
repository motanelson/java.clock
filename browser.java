
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class browser {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        boolean insideBody = false;
        boolean insideScript = false;

        Pattern bodyPattern = Pattern.compile("<body", Pattern.CASE_INSENSITIVE);
        Pattern scriptStart = Pattern.compile("<script", Pattern.CASE_INSENSITIVE);
        Pattern scriptEnd = Pattern.compile("</script", Pattern.CASE_INSENSITIVE);
        Pattern breakPattern = Pattern.compile("(<br|<p|</p)", Pattern.CASE_INSENSITIVE);
        Pattern hrefPattern = Pattern.compile("href\\s*=\\s*\"([^\"]*)\"", Pattern.CASE_INSENSITIVE);
        Pattern tagStripper = Pattern.compile("<.*?>");

        System.out.print("\033[43;30m\033[2J"); // Limpar terminal
        System.out.flush();
        System.out.println("\n\n");

        while (scanner.hasNextLine()) {
            String line = scanner.nextLine();

            if (!insideBody) {
                if (bodyPattern.matcher(line).find()) {
                    insideBody = true;
                }
            }

            if (insideBody) {
                if (scriptStart.matcher(line).find()) {
                    insideScript = true;
                }
                if (scriptEnd.matcher(line).find()) {
                    insideScript = false;
                    continue;
                }

                if (!insideScript) {
                    // Nova linha em certas tags
                    if (breakPattern.matcher(line).find()) {
                        System.out.println();
                    }

                    // Extrair href="..."
                    Matcher hrefMatcher = hrefPattern.matcher(line);
                    while (hrefMatcher.find()) {
                        System.out.println(hrefMatcher.group(1));
                    }

                    // Remover tags e imprimir texto visível
                    String cleanText = tagStripper.matcher(line).replaceAll("");
                    if (!cleanText.trim().isEmpty()) {
                        System.out.print(cleanText + " ");
                    }
                }
            }
        }

        scanner.close();
    }
}
