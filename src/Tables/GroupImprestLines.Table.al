Table 52194050 "Group Imprest Lines"
{

    fields
    {
        field(1;"Imprest No";Code[20])
        {
            TableRelation = "Request Header1";
        }
        field(2;"Employee No.";Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Empl.Get("Employee No.") then
                 begin
                   "Employee Name":=Empl."First Name"+' '+Empl."Last Name";
                 end;


                if ImprestHeader.Get("Imprest No")  then begin
                if EmpAccmap.Get("Employee No.",ImprestHeader."Transaction Type") then
                 begin
                  "Customer No":=EmpAccmap."Customer A/c";
                 end else
                  Error(Text000,"Employee No.",ImprestHeader."Transaction Type");
                end;
            end;
        }
        field(3;"Employee Name";Text[150])
        {
        }
        field(4;"Customer No";Code[20])
        {
            TableRelation = Customer;
        }
        field(5;Amount;Decimal)
        {

            trigger OnValidate()
            begin
                CheckTotal;
            end;
        }
        field(6;"Actual Spent";Decimal)
        {
        }
        field(7;"Remaining Amount";Decimal)
        {
        }
        field(8;"Amount Requested";Decimal)
        {

            trigger OnValidate()
            begin
                CheckTotal;
            end;
        }
    }

    keys
    {
        key(Key1;"Imprest No","Employee No.","Customer No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Empl: Record Employee;
        UsersRec: Record "User Setup";
        EmpAccmap: Record "Employee Account Mapping1";
        ImprestHeader: Record "Request Header1";
        Text000: label 'There is no employee account mapping for the Employee %1 for Transaction Type %2';
        Text001: label 'The amount allocated to the employees has exceed the requested amount of %1 by %2 \ Check your allocations';


    procedure CheckTotal()
    var
        ImprestHeader: Record "Request Header1";
        ImpLines: Record "Group Imprest Lines";
    begin
        if ImprestHeader.Get("Imprest No") then;
           ImprestHeader.CalcFields("Imprest Amount","Total Amount Requested");

        ImpLines.Reset;
        ImpLines.SetRange("Imprest No","Imprest No");
        ImpLines.SetFilter("Employee No.",'<>%1',"Employee No.");
        ImpLines.CalcSums(Amount,"Amount Requested");

        if ImpLines.Amount+Amount>ImprestHeader."Imprest Amount" then
          Error(Text001,ImprestHeader."Imprest Amount",((ImpLines.Amount+Amount)-ImprestHeader."Imprest Amount"));

        if ImpLines."Amount Requested"+"Amount Requested">ImprestHeader."Total Amount Requested" then
          Error(Text001,ImprestHeader."Total Amount Requested",((ImpLines."Amount Requested"+"Amount Requested")-ImprestHeader."Total Amount Requested"));
    end;
}

