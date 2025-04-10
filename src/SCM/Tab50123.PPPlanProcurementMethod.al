table 50123 "PP Plan Procurement Method"
{
    Caption = 'PP Plan Procurement Method';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Solicitation Type".code;
            trigger onvalidate()
            var
                myInt: Record "Solicitation Type";
            begin
                myInt.Reset();
                ;
                myInt.setrange(Code, Code);
                if myInt.findset() then
                    Description := myInt.Description;
                "Default Procurement Method" := myInt."Default Procurement Method";
            end;
        }
        field(2; "Default Procurement Method"; Option)
        {
            DataClassification = ToBeClassified;
            EDITABLE = FALSE;
            OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction';
            OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction";
        }
        field(3; Description; Text[50])
        {
            DataClassification = ToBeClassified;
            EDITABLE = FALSE;
        }

        field(5; "Procurement Plan ID"; Code[20])
        {

            DataClassification = ToBeClassified;

        }
        field(6; "Plan Entry No."; Integer)
        {

            DataClassification = ToBeClassified;
        }
        field(7; "Planning Category"; Code[50])
        {
            DataClassification = ToBeClassified;

        }
    }
    keys
    {
        key(PK; "Code", "Procurement Plan ID", "Plan Entry No.", "Planning Category")
        {
            Clustered = true;
        }
    }
}
