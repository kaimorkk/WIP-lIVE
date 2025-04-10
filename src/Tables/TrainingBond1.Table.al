Table 52193956 "Training Bond1"
{
    LookupPageID = "Training Bond1";

    fields
    {
        field(1;"Request No.";Code[20])
        {
            TableRelation = "Training Request1";

            trigger OnValidate()
            begin

                 if "training rec".Get("Request No.") then
                 begin
                   "Employee No":="training rec"."Employee No";
                   "Employee Name":="training rec"."Employee Name";
                   "Total Cost":="training rec"."Total Cost (LCY)";
                   "No of Days":="training rec"."No. Of Days";
                   "Training Insitution":="training rec"."Training Insitution";

                end;
            end;
        }
        field(2;"Request Date";Date)
        {
        }
        field(3;"Employee No";Code[10])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if empl.Get("Employee No") then
                "Employee Name":=empl."First Name"+ ' '+empl."Middle Name"+' '+empl."Last Name";
                "ID NO":=empl."ID Number";
                "Employee Address":=empl."Postal Address";
                
                  /* IF empl.GET(UserSetup."Employee No.") THEN
                   "Employee Name":=empl."First Name"+ ' '+empl."Middle Name"+' '+empl."Last Name";
                    "ID NO":=empl."ID Number";*/

            end;
        }
        field(4;"Employee Name";Text[50])
        {
        }
        field(5;"No. Series";Code[10])
        {
            TableRelation = "No. Series";
        }
        field(6;"Department Code";Code[10])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(7;Status;Option)
        {
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
        }
        field(8;Designation;Text[30])
        {
        }
        field(9;Period;DateFormula)
        {
        }
        field(10;"No. Of Days";Decimal)
        {
        }
        field(11;"Training Insitution";Text[50])
        {
        }
        field(12;Venue;Text[30])
        {

            trigger OnValidate()
            begin
                 //CALCFIELDS(Budget,Actual,Commitment);
                 //"Available Funds":=Budget-Actual-Commitment;
            end;
        }
        field(13;"Tuition Fee";Decimal)
        {

            trigger OnValidate()
            begin
                "Total Cost":="Tuition Fee"+"Per Diem"+"Air Ticket";
            end;
        }
        field(14;"Per Diem";Decimal)
        {

            trigger OnValidate()
            begin
                "Total Cost":="Tuition Fee"+"Per Diem"+"Air Ticket";
            end;
        }
        field(15;"Air Ticket";Decimal)
        {

            trigger OnValidate()
            begin
                "Total Cost":="Tuition Fee"+"Per Diem"+"Air Ticket";
            end;
        }
        field(16;"Total Cost";Decimal)
        {
            TableRelation = "Training Request1";
        }
        field(17;"Course Title";Code[20])
        {
            NotBlank = true;
            TableRelation = "Training Needs1".Code;

            trigger OnValidate()
            begin
                //IF TrainingNeeds.GET("Course Title") THEN
                //Description:=TrainingNeeds.Description;
            end;
        }
        field(18;Description;Text[150])
        {
        }
        field(19;"First Surety";Text[50])
        {
        }
        field(20;Address;Text[100])
        {
        }
        field(21;"Second Surety";Text[50])
        {
        }
        field(22;Address2;Text[100])
        {
        }
        field(23;"Employee Address";Text[50])
        {
        }
        field(24;"ID No.1";Text[30])
        {
        }
        field(25;"ID NO.2";Text[30])
        {
        }
        field(26;"ID NO";Text[30])
        {
        }
        field(27;"No of Days";Decimal)
        {
        }
        field(28;Institution;Text[100])
        {
        }
        field(29;Telephone1;Text[30])
        {
        }
        field(30;Telephone2;Text[30])
        {
        }
        field(31;"Currency Code";Code[10])
        {
        }
        field(32;"User Id";Code[50])
        {
        }
    }

    keys
    {
        key(Key1;"Employee No","Request No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
                      "User Id":=UserId;
    end;

    var
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        empl: Record Employee;
        TrainingNeeds: Record "Training Needs1";
        CountryRec: Record "Country/Region";
        CompanyInfo: Record "Company Information";
        PurchSetup: Record "Purchases & Payables Setup";
        "training rec": Record "Training Request1";
}

