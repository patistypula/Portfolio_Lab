package pl.coderslab.charity.category;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

@DisplayName("Unit tests for CategoryService")
class CategoryServiceTest {

    private CategoryService categoryService;
    private CategoryRepository categoryRepository;

    @BeforeEach
    public void prepare() {
        categoryRepository = Mockito.mock(CategoryRepository.class);
        categoryService = new CategoryService(categoryRepository);
    }

    @Nested
    @DisplayName("unit tests for category")
    class NewCategory{
        @Test
        @DisplayName("Should RunTimeException when user try save existing category")
        public void shouldRunTimeExceptionWhenUserTrySaveExistingCategory() {
            Mockito.when(categoryRepository.existsByName("dupa"))
                    .thenReturn(true);

            Category category = new Category();
            category.setName("dupa");
            category.setId(2l);

            Assertions.assertThatThrownBy(() -> categoryService.saveNewCategory(category))
                    .hasNoCause()
                    .hasMessageContaining("dupa")
                    .hasMessageContaining("alredy exist")
                    .isInstanceOf(RuntimeException.class);
        }
    }
}
































