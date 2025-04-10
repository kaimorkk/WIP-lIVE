report 56244 "ICT Inventory issuance"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/ICT Inventory issuance.rdlc';

    dataset
    {
        dataitem("ICT Issuance Entries"; "ICT Issuance Entries")
        {
            RequestFilterFields = Type, "Code", "Issued To No.", "Location Code";
            column(COMPANY; CompanyInfo.Name)
            {
            }
            column(logo; CompanyInfo.Picture)
            {
            }
            column(PostCode; CompanyInfo."Post Code")
            {
            }
            column(City; CompanyInfo.City)
            {
            }
            column(Address; CompanyInfo.Address)
            {
            }
            column(Address2; CompanyInfo."Address 2")
            {
            }
            column(No_ICTIssuanceEntries; "ICT Issuance Entries"."No.")
            {
            }
            column(Code_ICTIssuanceEntries; "ICT Issuance Entries".Code)
            {
            }
            column(Description_ICTIssuanceEntries; "ICT Issuance Entries".Description)
            {
            }
            column(SerialNo_ICTIssuanceEntries; "ICT Issuance Entries"."Serial No.")
            {
            }
            column(DurationofUsestartdate_ICTIssuanceEntries; "ICT Issuance Entries"."Duration of Use start date")
            {
            }
            column(DurationofUseenddate_ICTIssuanceEntries; "ICT Issuance Entries"."Duration of Use end date")
            {
            }
            column(DurationofUse_ICTIssuanceEntries; "ICT Issuance Entries"."Duration of Use")
            {
            }
            column(FANo_ICTIssuanceEntries; "ICT Issuance Entries"."FA No")
            {
            }
            column(ReasonForMovement_ICTIssuanceEntries; "ICT Issuance Entries"."Reason For Movement")
            {
            }
            column(Type_ICTIssuanceEntries; UpperCase(Format("ICT Issuance Entries".Type)))
            {
            }
            column(IssuedToUserID_ICTIssuanceEntries; "ICT Issuance Entries"."Issued To User ID")
            {
            }
            column(IssuedToNo_ICTIssuanceEntries; "ICT Issuance Entries"."Issued To No.")
            {
            }
            column(Name_ICTIssuanceEntries; "ICT Issuance Entries".Name)
            {
            }
            column(IssuedDate_ICTIssuanceEntries; "ICT Issuance Entries"."Issued Date")
            {
            }
            column(BranchesCode_ICTIssuanceEntries; "ICT Issuance Entries"."Branches Code")
            {
            }
            column(Directorate_ICTIssuanceEntries; "ICT Issuance Entries".Directorate)
            {
            }
            column(Department_ICTIssuanceEntries; "ICT Issuance Entries".Department)
            {
            }
            column(DivisionUnit_ICTIssuanceEntries; "ICT Issuance Entries"."Division/Unit")
            {
            }
            column(LocationCode_ICTIssuanceEntries; "ICT Issuance Entries"."Location Code")
            {
            }
            column(IssuedBy_ICTIssuanceEntries; "ICT Issuance Entries"."Issued By")
            {
            }
            column(ShortcutDimension1Code_ICTIssuanceEntries; "ICT Issuance Entries"."Shortcut Dimension 1 Code")
            {
            }
            column(EntryNo_ICTIssuanceEntries; "ICT Issuance Entries"."Entry No")
            {
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}

