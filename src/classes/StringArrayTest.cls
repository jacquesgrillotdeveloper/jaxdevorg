public class StringArrayTest{
    public static List<string> generateStringArray(Integer n){
        List<String> myList = new List<String>();
        for(Integer i=0;i<n;i++){
            myList.add('Test '+i);
        }
        return myList;
    }
}