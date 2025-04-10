Table 52193729 "Book Issue Details1"
{
    // DrillDownPageID = 51511110;
    // //LookupPageID = UnknownPage51511110;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; "Request No"; Code[20])
        {
            TableRelation = "Book Issue1";

            trigger OnValidate()
            begin
                /* Request.GET("Request No");
                 "Borrower No.":=Request."Employee No";
                 "Borrower Name":=Request."Employee Name";
                 MODIFY;
                 */

            end;
        }
        field(3; "Book No"; Code[20])
        {
            TableRelation = Books1 where(Category = field(Category));

            trigger OnValidate()
            begin
                Book.Get("Book No");
                "Book Description" := Book.Description;
                ISBN := Book.ISBN;
                Modify;
            end;
        }
        field(4; "Book Description"; Text[200])
        {
        }
        field(5; ISBN; Code[20])
        {
        }
        field(7; "Issue Date"; Date)
        {

            trigger OnValidate()
            var
                em: DateFormula;
                em2: Integer;
                em3: Text[30];
                Expr1: Text[30];
            begin
                doctype.Get(Category);
                //MESSAGE('%1',doctype."DuePeriod (days)");
                //em:='<7D>';
                //Expr1 := '<CD+doctype."DuePeriod (days)">'; // Current quarter + 1 month - 10 days
                Expr1 := '<CD+' + doctype."DuePeriod (days)" + '>';
                // Current quarter + 1 month - 10 days

                //DAYS:=doctype."DuePeriod (days)";
                //em:= overdues."DuePeriod (days)";
                // em:='doctype."DuePeriod (days)"+D';
                //      MESSAGE('em %1',em);   7d
                "Due Date" := CalcDate(Expr1, "Issue Date");
                Modify;
            end;
        }
        field(8; "Due Date"; Date)
        {
        }
        field(9; "Issuer No."; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Emp.Get("Issuer No.");
                "Issuer Name." := Emp."First Name" + ' ' + Emp."Last Name";
                Modify;
            end;
        }
        field(10; "Issuer Name."; Text[80])
        {
        }
        field(12; "Return Date"; Date)
        {

            trigger OnValidate()
            begin
                doctype.Get(Category);
                if "Return Date" > "Due Date" then begin
                    //MESSAGE('%1',doctype.Rates);
                    //MESSAGE(overdues.Rates)
                    datediff := doctype.Rates * ("Return Date" - "Due Date");
                    "Amount overdue" := datediff;
                    Modify;
                    Daysoverdue := ("Return Date" - "Due Date");
                    Modify;

                    //  MESSAGE('Here is the return %1',datediff);
                end
            end;
        }
        field(13; "Issued?"; Boolean)
        {
        }
        field(14; "Returned?"; Boolean)
        {
        }
        field(15; Category; Code[10])
        {
            TableRelation = "Document Types1" where(Book = const(true));
        }
        field(16; "Receiver No."; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Emp.Get("Receiver No.");
                "Receiver Name" := Emp."First Name" + ' ' + Emp."Last Name";
                Modify;
            end;
        }
        field(17; "Receiver Name"; Text[80])
        {
        }
        field(18; "Borrower No."; Code[10])
        {
        }
        field(19; "Borrower Name"; Text[80])
        {
        }
        field(20; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(21; Daysoverdue; Integer)
        {
        }
        field(22; "Amount overdue"; Integer)
        {
        }
        field(23; "deduct by"; Option)
        {
            OptionCaption = '.......,Cash,Payrole';
            OptionMembers = Select,Cash,Payrole;
        }
        field(24; paid; Boolean)
        {
        }
        field(50000; "System Support Email Address"; Text[80])
        {
        }
        field(50001; "Employee Name"; Text[80])
        {
        }
        field(50002; "Request No."; Code[100])
        {
        }
    }

    keys
    {
        key(Key1; "Code", "Request No")
        {
            Clustered = true;
        }
        key(Key2; paid)
        {
        }
        key(Key3; Daysoverdue)
        {
        }
        key(Key4; "Issue Date")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            SalesSetup.Get;
            SalesSetup.TestField("Books Issue No");
            NoSeriesMgt.InitSeries(SalesSetup."Books Issue No", xRec.Code, 0D, Code, "No. Series");
            //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
        end;
    end;

    var
        Book: Record Books1;
        Emp: Record Employee;
        Request: Record "Book Issue Details1";
        SalesSetup: Record "Resource Centre Setup1";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        overdues: Record "Document Types1";
        datediff: Integer;
        doctype: Record "Document Types1";
        DAYS: Date;
        EXPR1: Text[30];
}

