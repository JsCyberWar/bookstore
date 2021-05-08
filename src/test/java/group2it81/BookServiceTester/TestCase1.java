package group2it81.BookServiceTester;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;

import group2it81.pojo.Book;
import group2it81.service.BookService;

public class TestCase1 {
    @Test
    public void test1(){
        BookService bs = new BookService();
        List<Book> rsBooks = bs.searchBookByName("Avenger");
        Book b = rsBooks.get(0);
        assertTrue(b.getTenSach().contains("Avenger"));
    }
    
    @Test
    public void test2(){
        BookService bs = new BookService();
        List<Book> rsBooks = bs.searchBookByName("and");
        Book b = rsBooks.get(0);
        assertTrue(b.getTenSach().contains("and"));
    }
}
