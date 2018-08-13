set serverout on
exec dbms_output.enable(100000);
declare
  page    number;
  len    number;
  c      varchar2(10);
  charpp number := 8132/2;

begin
  for r in (select rowid rid, dbms_lob.getlength (<your_clob_column>) len
            from   <your_table_with_clcob_column>) loop
    if r.len is not null then
      for page in 0..r.len/charpp loop
        begin
          select dbms_lob.substr (<your_clob_column>, 1, 1+ (page * charpp))
          into   c
          from   <your_table_with_clcob_column> 
          where  rowid = r.rid;
        
        exception
          when others then
            dbms_output.put_line ('Error on rowid ' ||R.rid||' page '||page);
            dbms_output.put_line (sqlerrm);
        end;
      end loop;
    end if;
  end loop;
end;
/
