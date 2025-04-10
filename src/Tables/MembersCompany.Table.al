Table 52193615 "Members Company"
{
    // DrillDownPageID = "Loan Group List";
    // LookupPageID = "Loan Group List";

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = false;

            trigger OnValidate()
            begin
                /*IF Code <> Rec.Code THEN BEGIN
                  SalesSetup.GET;
                  NoSeriesMgt.TestManual(SalesSetup."Loan Group Nos");
                  "No. Series" := '';
                END;*/

            end;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(31; Chair; Code[10])
        {
            // TableRelation = Customer."No." where("Company Code" = field(Code));

            trigger OnValidate()
            begin
                /* IF members.GET(Chair) THEN
                 "Chair Name":=members.Name;   */

            end;
        }
        field(32; Secretary; Code[10])
        {
            // TableRelation = Customer."No." where("Company Code" = field(Code));

            trigger OnValidate()
            begin
                if members.Get(Secretary) then
                    "Sec. Name" := members.Name;
            end;
        }
        field(33; Treasurer; Code[10])
        {
            // TableRelation = Customer."No." where("Company Code" = field(Code));

            trigger OnValidate()
            begin
                if members.Get(Treasurer) then
                    "Treasurer Name" := members.Name;
            end;
        }
        field(53001; "Total No. of Clients"; Integer)
        {
            // CalcFormula = count(Customer where("Company Code" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(53002; Supervisor; Code[10])
        {
            TableRelation = "Organizational Staff".Code where("Supervisor or Credit Officer" = const(Supervisor));

            trigger OnValidate()
            begin
                if salesperson.Get(Supervisor) then
                    "Supervisor Name" := salesperson.Name;
            end;
        }
        field(53003; "Credit Officer"; Code[10])
        {
            TableRelation = "Organizational Staff".Code where("Supervisor or Credit Officer" = const(Supervisor));

            trigger OnValidate()
            begin
                if salesperson.Get("Credit Officer", Supervisor) then
                    "Credit Officer Name" := salesperson.Name;
            end;
        }
        field(53004; "Savings Account No."; Code[10])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(53005; "Group Leader"; Code[10])
        {
            TableRelation = Customer."No." where("Customer Disc. Group" = field(Code));
        }
        field(53006; Address; Text[30])
        {
        }
        field(53007; "Phone No."; Text[30])
        {
        }
        field(53008; "Country Code"; Code[10])
        {
            Caption = 'Country Code';
            TableRelation = "Country/Region";
        }
        field(53009; "Loan Account No."; Code[10])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(53010; "Province Code"; Code[20])
        {
            TableRelation = Provinces.Code;

            trigger OnValidate()
            begin
                if Prov.Get("Province Code") then
                    Province := Prov."Province Name";
            end;
        }
        field(53012; "Constitution Date"; Date)
        {
        }
        field(53013; "Bank Account No."; Text[30])
        {
        }
        field(53015; "No. Series"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(53016; "Current Loan"; Decimal)
        {
            Editable = false;
        }
        field(53017; "Current Savings"; Decimal)
        {
            Editable = false;
        }
        field(53018; "Loan Cycle"; Integer)
        {
        }
        field(53019; "Meeting Days"; Text[30])
        {
        }
        field(53020; "Meeting Venue"; Text[30])
        {
        }
        field(53021; "No. of Female Clients"; Integer)
        {
            // CalcFormula = count(Customer where(Gender = const(Male),
            //                                     "Company Code" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(53022; "No. of Male Clients"; Integer)
        {
            //     CalcFormula = count(Customer where(Gender = const(" "),
            //                                         "Company Code" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(53023; "Current Loan No."; Code[10])
        {
        }
        field(53024; "Chair Name"; Text[30])
        {
            Editable = false;
        }
        field(53025; "Sec. Name"; Text[30])
        {
            Editable = false;
        }
        field(53026; "Treasurer Name"; Text[30])
        {
            Editable = false;
        }
        field(53029; Regions; Code[10])
        {
            TableRelation = "Gen. Business Posting Group".Code;
        }
        field(53030; "Supervisor Name"; Text[30])
        {
            CalcFormula = lookup("Organizational Staff".Name where(Code = field(Supervisor)));
            FieldClass = FlowField;
        }
        field(53031; "Credit Officer Name"; Text[30])
        {
            CalcFormula = lookup("Organizational Staff".Name where(Code = field("Credit Officer")));
            FieldClass = FlowField;
        }
        field(53032; Province; Text[80])
        {
        }
        field(53033; District; Text[80])
        {
        }
        field(53034; "Loan Product Type filter"; Code[20])
        {
            FieldClass = FlowFilter;
            //TableRelation = "Loan Product Types".Code;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        members: Record Customer;
        Prov: Record Provinces;
        salesperson: Record "Salesperson/Purchaser";
}

