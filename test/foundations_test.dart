import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:test/test.dart';

void main() {
  // the purpose of these tests are to explore Foundations functionality
  group('Foundations class', () {
    test('values can be changed', () {
      Foundations foundation = Foundations();
      foundation = foundation.copyWith(
        falsePlinth: FalsePlinthFoundation(
          area: 1,
          circumference: 2,
          material: FoundationMaterial.concreteBlock,
        ),
      );
      expect(
        foundation.falsePlinth?.material,
        equals(
          FoundationMaterial.concreteBlock,
        ),
      );
    });
    test('copied Foundations is a different instance', () {
      Foundations foundation = Foundations();
      // make a copy
      Foundations foundation2 = foundation;
      foundation2 = foundation2.copyWith(
        crawlSpace: CrawlSpaceFoundation(
          area: 2,
        ),
      );
      expect(
        // original instance didn't change
        foundation.crawlSpace?.area,
        equals(null),
      );
      expect(
        // copied instance has changed
        foundation2.crawlSpace?.area,
        equals(2),
      );
    });
    test('setting Foundations attributes with a passed function is doable', () {
      Foundations foundation = Foundations();
      // something like this works as a setter
      setCrawlSpaceArea(value) {
        foundation = foundation.copyWith(
          crawlSpace: CrawlSpaceFoundation(
            area: value,
          ),
        );
      }

      setCrawlSpaceArea(5);
      expect(
        foundation.crawlSpace?.area,
        equals(5),
      );
    });
    test('getting Foundations attributes with a passed function is doable', () {
      Foundations foundation = Foundations();
      foundation = foundation.copyWith(
        crawlSpace: CrawlSpaceFoundation(
          area: 4,
        ),
      );
      // getter
      num? getCrawlSpaceArea() {
        return foundation.crawlSpace?.area;
      }

      expect(
        getCrawlSpaceArea(),
        equals(4),
      );
    });
    test('total area works as expected with a mix of nulls and numbers', () {
      Foundations foundation = Foundations();
      foundation = foundation.copyWith(
        crawlSpace: CrawlSpaceFoundation(
          area: 1,
        ),
        falsePlinth: FalsePlinthFoundation(
          area: 2,
        ),
        shallow: ShallowFoundation(
          area: 3,
        ),
      );
      expect(
        foundation.pillar?.area,
        equals(null),
      );
      expect(
        foundation.area,
        equals(6),
      );
    });
  });
}
