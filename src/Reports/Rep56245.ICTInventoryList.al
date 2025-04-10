report 56245 "ICT Inventory List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/ICT Inventory List.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(ICT; "ICT Inventory")
        {
            column(cOMPANY; CompanyInfo.Name)
            {
            }
            column(LOGO; CompanyInfo.Picture)
            {
            }
            column(FYear; UpperCase(FYcode))
            {
            }
            column(custodian; Custodian)
            {
            }
            column(division; RCs)
            {
            }
            column(StartDate; SATAR)
            {
            }
            column(EndDate; ENDDAT)
            {
            }
            column(Code_ICT; ICT.Code)
            {
            }
            column(Description_ICT; ICT.Description)
            {
            }
            column(SubType_ICT; ICT."Sub-Type")
            {
            }
            column(SubTypeNo_ICT; ICT."Sub Type No.")
            {
            }
            column(LocationCode_ICT; ICT."Location Code")
            {
            }
            column(ICTAssetCategory_ICT; ICT."ICT Asset Category")
            {
            }
            column(SerialNo_ICT; ICT."Serial No.")
            {
            }
            column(WarrantyDate_ICT; ICT."Warranty Date")
            {
            }
            column(MaintenanceVendorNo_ICT; ICT."Maintenance Vendor No.")
            {
            }
            column(UnderMaintenance_ICT; ICT."Under Maintenance")
            {
            }
            column(SubTypeDescription_ICT; ICT."Sub Type Description")
            {
            }
            column(FAClassCode_ICT; ICT."FA Class Code")
            {
            }
            column(FASubclassCode_ICT; ICT."FA Subclass Code")
            {
            }
            column(Insured_ICT; ICT.Insured)
            {
            }
            column(CurrentAssignedEmployee_ICT; ICT."Current Assigned Employee")
            {
            }
            column(CurrentAssignedDivisionUnit_ICT; ICT."Current Assigned Division/Unit")
            {
            }
            column(Blocked_ICT; ICT.Blocked)
            {
            }
            column(AcquisitionCost_ICT; ICT."Acquisition Cost")
            {
            }
            column(NoSeries_ICT; ICT."No Series")
            {
            }
            column(NoofIssuesRaised_ICT; ICT."No. of Issues Raised")
            {
            }
            column(ExpiryDate_ICT; ICT."Expiry Date")
            {
            }
            column(HasExpiryDate_ICT; ICT."Has Expiry Date")
            {
            }
            column(SoftwareProductkey_ICT; ICT."Software Product key")
            {
            }
            column(Totalnumberoflicense_ICT; ICT."Total number of license")
            {
            }
            column(Email_ICT; ICT.Email)
            {
            }
            column(Link_ICT; ICT.Link)
            {
            }
            column(TagNo_ICT; ICT."Tag No")
            {
            }
            column(IPaddress_ICT; ICT."IP address")
            {
            }
            column(Makemodel_ICT; ICT."Make/model")
            {
            }
            column(Disposeddate_ICT; ICT."Disposed date")
            {
            }
            column(Manufactureddate_ICT; ICT."Manufactured date")
            {
            }
            column(LastMaintenanceDate_ICT; ICT."Last Maintenance Date")
            {
            }
            column(Manufacturer_ICT; ICT.Manufacturer)
            {
            }
            column(ICTAssetsubcategory_ICT; ICT."ICT Asset subcategory")
            {
            }
            column(Brand_ICT; ICT.Brand)
            {
            }
            column(Purchasedate_ICT; ICT."Purchase date")
            {
            }
            column(Status_ICT; ICT.Status)
            {
            }
            column(Nextservicedate_ICT; ICT."Next service date")
            {
            }
            column(Supplier_ICT; ICT.Supplier)
            {
            }
            column(Condition_ICT; ICT.Condition)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Employee.Reset;
                Employee.SetRange("No.", ICT."Current Assigned Employee");
                if Employee.FindSet then begin
                    Custodian := Employee."First Name" + ' ' + Employee."Last Name";
                end;
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(Code, ICT."Current Assigned Division/Unit");
                if ResponsibilityCenter.FindSet then begin
                    RCs := ResponsibilityCenter.Name;
                end;
            end;
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
        AnnualReportingCodes.Reset;
        AnnualReportingCodes.SetRange("Current Year", true);
        if AnnualReportingCodes.FindFirst then begin
            FYcode := AnnualReportingCodes.Code;
            ENDDAT := AnnualReportingCodes."Reporting End Date";
            SATAR := AnnualReportingCodes."Reporting Start Date";
        end;
    end;

    var
        CompanyInfo: Record "Company Information";
        AnnualReportingCodes: Record "Annual Reporting Codes";
        FYcode: Code[10];
        SATAR: Date;
        ENDDAT: Date;
        Employee: Record Employee;
        Custodian: Text;
        ResponsibilityCenter: Record "Responsibility Center";
        RCs: Text;
}

