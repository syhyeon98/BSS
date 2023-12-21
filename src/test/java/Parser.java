import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.jupiter.api.Test;
import org.springframework.expression.EvaluationContext;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.SimpleEvaluationContext;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class Parser {

	@Test
	void test() {
		String tmplSrc = "<div><h4>{#name}</h4><h4>{#age}</h4></div>";
		
		Pattern ptrn = Pattern.compile("\\{(#[\\w]+)\\}");
		Matcher matcher = ptrn.matcher(tmplSrc);
		
		EvaluationContext context = SimpleEvaluationContext.forReadOnlyDataBinding().build();
		context.setVariable("name", "Mike Tesla");
		context.setVariable("age",null);
		
		ExpressionParser parser = new SpelExpressionParser();
		
		StringBuffer result = new StringBuffer();
		while(matcher.find()) {
			String expression = matcher.group(1);
			Object value = parser.parseExpression(expression).getValue(context);
			String exprValue = Optional.ofNullable(value)
										.map(Object::toString)
										.orElse("");
			matcher.appendReplacement(result, exprValue);
		}
		matcher.appendTail(result);
		log.debug("===>{}", result);
		System.out.println(result);
	}
}
