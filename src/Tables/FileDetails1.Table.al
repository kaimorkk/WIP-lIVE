Table 52193709 "File Details1"
{
    DrillDownPageID = "File List";
    LookupPageID = "File List";

    fields
    {
        field(1;"File Code";Code[60])
        {
            NotBlank = false;

            trigger OnValidate()
            begin
                /*IF "File Code" <> "File Code" THEN BEGIN
                  SalesSetup.GET;
                  NoSeriesMgt.TestManual(SalesSetup."Registry File Numbers");
                  "No. Series" := '';
                END;
                */

            end;
        }
        field(2;"File Description";Text[100])
        {
        }
        field(3;"Max Size Recommended";Decimal)
        {
        }
        field(4;"Measure type for size";Option)
        {
            OptionMembers = ,CM,MM;
        }
        field(6;"File Status";Option)
        {
            OptionMembers = " ",Open,"Semi-Current",Closed,Archived;

            trigger OnValidate()
            begin
                if "Disposal Action"="disposal action"::Archive then  begin
                 if "Disposal Date"<=Today  then
                "File Status":="file status"::Closed
                  end;
            end;
        }
        field(7;"First Category";Code[30])
        {
            TableRelation = "File Types1";
        }
        field(8;"Second Category";Code[30])
        {
            TableRelation = "File Details1" where ("First Category"=field("First Category"),
                                                   "Second Category"=filter(''));
        }
        field(9;"Current Size";Decimal)
        {

            trigger OnValidate()
            begin
                if "Current Size"="Max Size Recommended" then begin


                "File Status":="file status"::Open;
                end else if "Current Size">"Max Size Recommended" then begin


                Error('The File has exceeded the recommended maximum size!');
                end;
            end;
        }
        field(10;"Measure type";Option)
        {
            OptionMembers = ,CM,MM;
        }
        field(11;"Retention Period(Yrs)";DateFormula)
        {
        }
        field(12;"Date Closed";Date)
        {
        }
        field(13;"Disposal Action";Option)
        {
            OptionMembers = Destroy,Archive;
        }
        field(14;"Disposal Date";Date)
        {
        }
        field(15;"Third Category";Code[30])
        {
            TableRelation = "File Details1" where ("First Category"=field("First Category"),
                                                   "Second Category"=field("Second Category"),
                                                   "Third Category"=filter(''));
        }
        field(16;"Fourth Category";Code[30])
        {
            TableRelation = "File Details1" where ("First Category"=field("First Category"),
                                                   "Second Category"=field("Second Category"),
                                                   "Third Category"=field("Third Category"),
                                                   "Fourth Category"=filter(''));
        }
        field(17;Pensioner;Code[20])
        {
        }
        field(18;Contributer;Code[20])
        {

            trigger OnValidate()
            begin
                 //Pensioners.GET( Contributer);

                 //Contributer:=Pensioners.SurName;
            end;
        }
        field(19;"Pensioner Name";Text[20])
        {
        }
        field(20;"Contributer Name";Text[20])
        {
        }
        field(21;"Attached Documents";Integer)
        {
            CalcFormula = count("Document Management1" where (File=field("File Code")));
            FieldClass = FlowField;
        }
        field(22;"Employee File?";Boolean)
        {

            trigger OnValidate()
            begin
                if "Employee File?"=true then
                TestField("Employee ID");
            end;
        }
        field(23;"Employee ID";Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin

                Emp.Get("Employee ID");
                "Employee Name":=Emp."Last Name"+' '+Emp."First Name";
            end;
        }
        field(24;"Employee Name";Text[40])
        {
        }
        field(25;Status;Option)
        {
            OptionCaption = 'Available,Not Available';
            OptionMembers = Available,"Not Available";
        }
        field(26;Volume;Code[30])
        {
        }
        field(27;"Member Status";Option)
        {
            OptionCaption = ',Active,Retired,Cleared';
            OptionMembers = ,Active,Retired,Cleared;
        }
        field(28;"SF No.";Code[20])
        {
        }
        field(29;"Integer SF No";Integer)
        {
        }
        field(30;"Creation Date";Date)
        {
        }
        field(31;FirstC;Integer)
        {
        }
        field(32;SecondC;Integer)
        {
        }
        field(33;ThirdC;Integer)
        {
        }
        field(34;FourthC;Integer)
        {
        }
        field(35;"File Position";Integer)
        {
        }
    }

    keys
    {
        key(Key1;"File Code","First Category","Second Category","Third Category","Fourth Category",Volume)
        {
            Clustered = true;
        }
        key(Key2;"SF No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        /*
        
        IF "File Code" = '' THEN BEGIN
          SalesSetup.GET;
          SalesSetup.TESTFIELD("Registry File Numbers");
          NoSeriesMgt.InitSeries(SalesSetup."Registry File Numbers",xRec."File Code",0D,"File Code","No. Series");
        END;
        
        */
        
        if "First Category"='25' then  begin
        
          "File Code":='25';
          Volume:='VOL 1';
        
        end else begin
        
        
        if "File Code"='' then begin
        
        FileCode:='';
        First:='';
        LastNumber:='';
        //LastCharacter:='';
        OriginalCode:='';
        "File Status":="file status"::Open;
        
        if "First Category"<>''  then begin
        
          if "Second Category"<>''then begin
        
            if "Third Category"<>''then begin
        
              if "Fourth Category"<>'' then begin
        
                fil.Reset;
                fil.SetRange("First Category","First Category");
                fil.SetRange("Second Category","Second Category");
                fil.SetRange("Third Category","Third Category");
                fil.SetRange("Fourth Category","Fourth Category");
        
        
                  if fil.FindLast then begin
        
                    First:=fil."Fourth Category";
                    FileCode:=fil."File Code";
        
                   // LastNumber:=DELCHR(FileCode,'<>',First+'/');
                    //MaxLength:=STRLEN(First);
                   Message('%1',MaxLength);
                    MaxLength:=MaxLength+1;
                    LastNumber:=DelStr(FileCode,1,MaxLength);
                    LastNumber:=IncStr(LastNumber);
                    FileCode:=First+'/'+LastNumber;
                    "File Code":=FileCode;
                    Volume:='VOL 1';
        
        
                  end else begin
                    First:="Fourth Category";
        
                    FileCode:=First+'/'+'1';
                    "File Code":=FileCode;
                    Volume:='VOL 1';
                   // MESSAGE('%1',FileCode);
                  end;
        
         end else begin
               fil.Reset;
               fil.SetRange("First Category","First Category");
               fil.SetRange("Second Category","Second Category");
               fil.SetRange("Third Category","Third Category");
               fil.SetRange(fil."Fourth Category",'');
        
        
                if fil.FindLast then begin
        
                  First:=fil."Third Category";
                  FileCode:=fil."File Code";
        
                 // LastNumber:=DELCHR(FileCode,'<>',First+'/');
                 MaxLength:=StrLen(First);
                    MaxLength:=MaxLength+1;
                    LastNumber:=DelStr(FileCode,1,MaxLength);
                    LastNumber:=IncStr(LastNumber);
                    FileCode:=First+'/'+LastNumber;
                    "File Code":=FileCode;
                    Volume:='VOL 1';
                 //MESSAGE('%1',MaxLength);
        
        
                end else begin
                  First:="Third Category";
        
                  FileCode:=First+'/'+'1';
                  "File Code":=FileCode;
                  Volume:='VOL 1';
                  //MESSAGE('%1',FileCode);
                end;
              end;
        
            end else begin
               fil.Reset;
               fil.SetRange("First Category","First Category");
               fil.SetRange("Second Category","Second Category");
               fil.SetRange(fil."Third Category",'');
               fil.SetRange(fil."Fourth Category",'');
        
        
                if fil.FindLast then begin
        
                  First:=fil."Second Category";
                  FileCode:=fil."File Code";
                  //LastNumber:=DELCHR(FileCode,'<',First+'/');
        
                 MaxLength:=StrLen(First);
                 MaxLength:=MaxLength+1;
                 LastNumber:=DelStr(FileCode,1,MaxLength);
                 LastNumber:=IncStr(LastNumber);
                 FileCode:=First+'/'+LastNumber;
                 "File Code":=FileCode;
                 Volume:='VOL 1';
        
        
                end else begin
                  First:="Second Category";
                 // MESSAGE('%1',First);
        
                  FileCode:=First+'/'+'1';
                  FileCode:=DelChr(FileCode,'<>',' ');
                  "File Code":=FileCode;
                  Volume:='VOL 1';
                  //MESSAGE('%1',FileCode);
                end;
            end;
           // end;
          end else begin
            fil.Reset;
            fil.SetRange("First Category","First Category");
            fil.SetRange(fil."Second Category",'');
            fil.SetRange(fil."Third Category",'');
            fil.SetRange(fil."Fourth Category",'');
        
              if fil.FindLast then begin
                First:=fil."First Category";
                FileCode:=fil."File Code";
               // LastNumber:=DELCHR(FileCode,'<>',First+'/');
        
                 MaxLength:=StrLen(First);
                  MaxLength:=MaxLength+1;
                    LastNumber:=DelStr(FileCode,1,MaxLength);
                    LastNumber:=IncStr(LastNumber);
                    FileCode:=First+'/'+LastNumber;
                    "File Code":=FileCode;
                    Volume:='VOL 1';
        
              end else begin
                First:="First Category";
                //MESSAGE('%1',First);
        
        
                FileCode:=First+'/'+'1';
                "File Code":=FileCode;
                Volume:='VOL 1';
        
                //MESSAGE('%1',FileCode)
              end;
        
          end;
        end;
        
        end;
        
        
        
        end;
        //END;

    end;

    trigger OnModify()
    begin
        if "Current Size"="Max Size Recommended" then


        "File Status":="file status"::"Semi-Current"

         // THEN
        //ERROR('HAPANA');
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        fil: Record "File Details1";
        FileCode: Code[50];
        LastNumber: Code[30];
        First: Code[30];
        LastCharacter: Integer;
        OriginalCode: Code[30];
        classified: Record "File Types1";
        FileCode2: Text[30];
        MaxLength: Integer;
        Emp: Record Employee;
        FileNo: Code[30];
        SFNumber: Code[30];
}

