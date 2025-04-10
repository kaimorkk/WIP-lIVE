report 59014 "Fleet Vehicle Insurance Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Fleet Vehicle Insurance Report.rdlc';

    dataset
    {
        dataitem(Insurance; Insurance)
        {
            column(No_Insurance; Insurance."No.")
            {
            }
            column(EffectiveDate_Insurance; Insurance."Effective Date")
            {
            }
            column(ExpirationDate_Insurance; Insurance."Expiration Date")
            {
            }
            column(PolicyNo_Insurance; Insurance."Policy No.")
            {
            }
            column(AnnualPremium_Insurance; Insurance."Annual Premium")
            {
            }
            column(PolicyCoverage_Insurance; Insurance."Policy Coverage")
            {
            }
            column(TotalValueInsured_Insurance; Insurance."Total Value Insured")
            {
            }
            column(Comment_Insurance; Insurance.Comment)
            {
            }
            column(InsuranceType_Insurance; Insurance."Insurance Type")
            {
            }
            column(LastDateModified_Insurance; Insurance."Last Date Modified")
            {
            }
            column(InsuranceVendorNo_Insurance; Insurance."Insurance Vendor No.")
            {
            }
            column(FAClassCode_Insurance; Insurance."FA Class Code")
            {
            }
            column(FASubclassCode_Insurance; Insurance."FA Subclass Code")
            {
            }
            column(FALocationCode_Insurance; Insurance."FA Location Code")
            {
            }
            column(GlobalDimension1Code_Insurance; Insurance."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_Insurance; Insurance."Global Dimension 2 Code")
            {
            }
            column(LocationCode_Insurance; Insurance."Location Code")
            {
            }
            column(Blocked_Insurance; Insurance.Blocked)
            {
            }
            column(Description_Insurance; Insurance.Description)
            {
            }
            column(SearchDescription_Insurance; Insurance."Search Description")
            {
            }
            column(DateFilter_Insurance; Insurance."Date Filter")
            {
            }
            column(NoSeries_Insurance; Insurance."No. Series")
            {
            }
            // column(ShortcutDimension3Code_Insurance; Insurance."Shortcut Dimension 3 Code")
            // {
            // }
            // column(ShortcutDimension4Code_Insurance; Insurance."Shortcut Dimension 4 Code")
            // {
            // }
            // column(ShortcutDimension5Code_Insurance; Insurance."Shortcut Dimension 5 Code")
            // {
            // }
            // column(FANo_Insurance; Insurance."FA No.")
            // {
            // }
            // column(RegistrationNo_Insurance; Insurance."Registration No.")
            // {
            // }
            // column(VehicleDescription_Insurance; Insurance."Vehicle Description")
            // {
            // }
            // column(Type_Insurance; Insurance.Type)
            // {
            // }
            // column(Make_Insurance; Insurance.Make)
            // {
            // }
            // column(Model_Insurance; Insurance.Model)
            // {
            // }
            column(CI_Picture; CI.Picture)
            {
            }
            column(CI_Address; CI.Address)
            {
            }
            column(CI__Address_2______CI__Post_Code_; CI."Address 2" + ' ' + CI."Post Code")
            {
            }
            column(CI_City; CI.City)
            {
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
            }
            column(COMPANYNAME; CompanyName)
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

    trigger OnInitReport()
    begin
        CI.Get;
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
}

