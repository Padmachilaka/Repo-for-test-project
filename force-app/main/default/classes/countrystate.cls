public class countrystate {
    public void counstate(String s)
    {
        list<string> lst=new List<String>{'India','Australia','England'};
        list<string> l1=new List<string>{'a','b','c'};
        list<string> l2=new List<string>{'d','e','f'};
        list<string> l3=new List<string>{'v','w','x'};
     Map<string,list<string>> mapName =new  Map<string,list<string>>();
     mapName.put(lst[0],l1);
     mapName.put(lst[1],l2) ;
     mapName.put(lst[2],l3) ; 
        for(string str:mapName.keyset())
        {
            if(mapName.get(str).contains(s))
            {
                system.debug(str);
                break;
            }
        }
    }

}