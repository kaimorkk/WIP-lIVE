Table 52193672 "Prequalified Suppliers"
{
    // DrillDownPageID = "Approved Fleet Requests List";
    // LookupPageID = "Approved Fleet Requests List";

    fields
    {
        field(1; "Ref No."; Code[20])
        {
            TableRelation = "Procurement Request";
        }
        field(2; Name; Text[50])
        {
            NotBlank = true;
        }
        field(3; "Physical Address"; Text[60])
        {
        }
        field(4; "Postal Address"; Text[60])
        {
        }
        field(5; City; Code[20])
        {
        }
        field(6; "E-mail"; Text[50])
        {
        }
        field(7; "Telephone No"; Code[50])
        {
        }
        field(8; "Mobile No"; Code[15])
        {
        }
        field(9; "Contact Person"; Text[30])
        {
        }
        field(10; "KBA Bank Code"; Code[5])
        {
            //TableRelation = Table69003.Field2;
        }
        field(11; "KBA Branch Code"; Code[3])
        {
            //TableRelation = Table69003.Field13 where (Field2=field("KBA Bank Code"));
        }
        field(12; "Bank account No"; Code[10])
        {
        }
        field(13; Category; Code[10])
        {
            TableRelation = "Supplier Category";
        }
        field(14; "Fiscal Year"; Code[10])
        {
        }
        field(15; Selected; Boolean)
        {
        }
        field(16; "Pre Qualified"; Boolean)
        {
        }
        field(17; "Fax No"; Text[30])
        {
        }
        field(18; "Category Name"; Text[60])
        {
        }
        field(19; "Registration No"; Code[20])
        {
        }
        field(20; "Company PIN No"; Code[20])
        {
        }
        field(21; "Vendor No"; Code[20])
        {
            // TableRelation = Vendor where("Debtor Type" = filter("Vendor Account"));

            trigger OnValidate()
            begin
                if Vend.Get("Vendor No") then
                    Name := Vend.Name;
            end;
        }
        field(22; "Vendor Type"; Option)
        {
            OptionMembers = "  ",Medical,Law;
        }
        field(23; Status; Option)
        {
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Rejected,Approved,Closed';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Rejected,Approved,Closed;
        }
        field(24; Attachment; Boolean)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Vendor No", Name, Category, "Fiscal Year")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Vend: Record Vendor;


    procedure CreateVend(var Prequalifiedlist: Record "Prequalified Suppliers")
    var
        Vend: Record Vendor;
        CategoryRec: Record "Supplier Category";
    begin

        Prequalifiedlist.TestField(Prequalifiedlist."Company PIN No");
        Vend.SetCurrentkey("PIN Number");
        Vend.SetRange(Vend."PIN Number", Prequalifiedlist."Company PIN No");
        if Vend.FindFirst then
            Error('The Vendor %1 PIN No %2 already exists in the system', Vend.Name, Vend."PIN Number");

        Vend.Init;
        Vend."No." := '';
        Vend.Name := Prequalifiedlist.Name;
        Vend.Address := Prequalifiedlist."Physical Address";
        Vend."Address 2" := Prequalifiedlist."Postal Address";
        Vend."E-Mail" := Prequalifiedlist."E-mail";
        Vend."Phone No." := Prequalifiedlist."Telephone No";
        Vend."Telex No." := Prequalifiedlist."Mobile No";
        Vend.Contact := Prequalifiedlist."Contact Person";
        //Vend."KBA Code":=Prequalifiedlist."KBA Bank Code";
        //Vend."KBA Branch Code":=Prequalifiedlist."KBA Branch Code";
        Vend."Our Account No." := Prequalifiedlist."Bank account No";
        //Vend."Vendor Type":=Prequalifiedlist."Vendor Type";
        Vend."PIN Number" := Prequalifiedlist."Company PIN No";
        // Vend."VAT No" := Prequalifiedlist."Registration No";
        if CategoryRec.Get(Prequalifiedlist.Category) then begin
            Vend."Gen. Bus. Posting Group" := CategoryRec."Gen. Bus. Posting Group";
            Vend."VAT Bus. Posting Group" := CategoryRec."VAT Bus. Posting Group";
            Vend."Vendor Posting Group" := CategoryRec."Vendor Posting Group";
        end;
        Vend.Insert(true);

        Prequalifiedlist."Vendor No" := Vend."No.";
        Prequalifiedlist.Modify;
    end;
}

