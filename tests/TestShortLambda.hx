package ;

import tink.Lang;

class TestShortLambda extends Base implements Lang {
	function testMatchers() {
		var res = [];
		var f = switch [_, _, _] {
			case ['true', b, _]: b;
			case [_, _, c]: c;
		}
		var f = function (a, b, c)
			res.push(f(a, b, c));
		f('true', 4, 5);
		f('trux', 4, 5);
		
		var f = switch _ {
			case 0: 0;
			case neg if (neg < 0): res.push(-neg);
			case pos: res.push(pos);
		}
		
		f(-1);
		f(0);
		f(1);
		
		assertEquals('4,5,1,1', res.join(','));
	}
	
	function testArrow() {
		var a = [0,1,2,3,4].filter(x => x & 1 == 0).map(x => x >>> 1);
		assertEquals('0,1,2', a.join(','));
	}
}