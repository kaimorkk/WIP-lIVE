report 56246 "ICT Equipment Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/ICT Equipment Summary.rdlc';

    dataset
    {
        dataitem("ICT Asset subcategory"; "ICT Asset subcategory")
        {
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
            column(Code_ICTAssetsubcategory; "ICT Asset subcategory".Code)
            {
            }
            column(Name_ICTAssetsubcategory; "ICT Asset subcategory".Name)
            {
            }
            column(AssetCategory_ICTAssetsubcategory; "ICT Asset subcategory"."Asset Category")
            {
            }
            column(NoofICTInventory_ICTAssetsubcategory; "ICT Asset subcategory"."No. of ICT Inventory")
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

