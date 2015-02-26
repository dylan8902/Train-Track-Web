require 'rest_client'
module NationalRailApiHelper

  DEBUG = true
  URL = 'https://lite.realtime.nationalrail.co.uk/OpenLDBWS/ldb6.asmx'
  ACCESS_TOKEN = ENV['TRAINS_ACCESS_TOKEN']
  SOAP_HEADERS = '<?xml version="1.0"?><SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns1="http://thalesgroup.com/RTTI/2014-02-20/ldb/" xmlns:ns2="http://thalesgroup.com/RTTI/2010-11-01/ldb/commontypes"><SOAP-ENV:Header><ns2:AccessToken><ns2:TokenValue>' + ACCESS_TOKEN + '</ns2:TokenValue></ns2:AccessToken></SOAP-ENV:Header>'


  def self.get_departure_board crs    
    type = "DepartureBoard"
    return NationalRailApiHelper.get_board type, crs
  end


  def self.get_arrival_board crs    
    type = "ArrivalBoard"
    return NationalRailApiHelper.get_board type, crs
  end
  

  def self.get_service service_id
    soap_body = '<SOAP-ENV:Body><ns1:GetServiceDetailsRequest><ns1:serviceID>' + service_id + '</ns1:serviceID></ns1:GetServiceDetailsRequest></SOAP-ENV:Body></SOAP-ENV:Envelope>'
    begin
      if DEBUG
        service_id = "HreTSea4sUYimcIawP8ujg=="
        xml_good = '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><soap:Body><GetServiceDetailsResponse xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/"><GetServiceDetailsResult><generatedAt xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">2015-02-24T21:15:02.8287755+00:00</generatedAt><serviceType xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">train</serviceType><locationName xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">Cardiff Central</locationName><crs xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">CDF</crs><operator xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">Arriva Trains Wales</operator><operatorCode xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">AW</operatorCode><sta xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">20:59</sta><ata xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">21:01</ata><std xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">21:10</std><atd xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">On time</atd><previousCallingPoints xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types"><callingPointList serviceType="train" serviceChangeRequired="false" assocIsCancelled="false"><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Caerphilly</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">CPH</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">20:40</st><at xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">On time</at></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Lisvane &amp; Thornhill</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">LVT</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">20:44</st><at xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">On time</at></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Llanishen</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">LLS</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">20:46</st><at xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">20:48</at></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Heath High Level</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">HHL</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">20:49</st><at xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">On time</at></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Cardiff Queen Street</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">CDQ</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">20:56</st><at xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">20:58</at></callingPoint></callingPointList></previousCallingPoints><subsequentCallingPoints xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types"><callingPointList serviceType="train" serviceChangeRequired="false" assocIsCancelled="false"><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Grangetown</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">GTN</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">21:14</st><at xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">On time</at></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Cogan</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">CGN</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">21:18</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">On time</et></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Eastbrook</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">EBK</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">21:20</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">On time</et></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Dinas Powys</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">DNS</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">21:22</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">On time</et></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Cadoxton</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">CAD</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">21:26</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">On time</et></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Barry Docks</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">BYD</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">21:29</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">On time</et></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Barry</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">BRY</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">21:33</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">On time</et></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Barry Island</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">BYI</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">21:40</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">On time</et></callingPoint></callingPointList></subsequentCallingPoints></GetServiceDetailsResult></GetServiceDetailsResponse></soap:Body></soap:Envelope>'
        xml_cancelled = '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><soap:Body><GetServiceDetailsResponse xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/"><GetServiceDetailsResult><generatedAt xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">2015-02-25T22:09:46.3731282+00:00</generatedAt><serviceType xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">train</serviceType><locationName xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">Port Glasgow</locationName><crs xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">PTG</crs><operator xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">ScotRail</operator><operatorCode xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">SR</operatorCode><isCancelled xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">true</isCancelled><disruptionReason xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">This train has been cancelled because of overhead wire problems</disruptionReason><std xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">22:39</std><etd xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">Cancelled</etd><previousCallingPoints xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types"><callingPointList serviceType="train" serviceChangeRequired="false" assocIsCancelled="false"><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Gourock</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">GRK</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">22:24</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Cancelled</et></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Fort Matilda</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">FTM</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">22:27</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Cancelled</et></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Greenock West</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">GKW</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">22:30</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Cancelled</et></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Greenock Central</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">GKC</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">22:32</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Cancelled</et></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Cartsdyke</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">CDY</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">22:35</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Cancelled</et></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Bogston</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">BGS</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">22:37</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Cancelled</et></callingPoint></callingPointList></previousCallingPoints><subsequentCallingPoints xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types"><callingPointList serviceType="train" serviceChangeRequired="false" assocIsCancelled="false"><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Woodhall</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">WDL</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">22:42</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Cancelled</et></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Langbank</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">LGB</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">22:46</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Cancelled</et></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Bishopton</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">BPT</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">22:51</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Cancelled</et></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Paisley St James</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">PYJ</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">22:56</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Cancelled</et></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Paisley Gilmour Street</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">PYG</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">22:59</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Cancelled</et></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Hillington West</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">HLW</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">23:03</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Cancelled</et></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Hillington East</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">HLE</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">23:05</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Cancelled</et></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Cardonald</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">CDO</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">23:07</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Cancelled</et></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Glasgow Central</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">GLC</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">23:14</st><et xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Cancelled</et></callingPoint></callingPointList></subsequentCallingPoints></GetServiceDetailsResult></GetServiceDetailsResponse></soap:Body></soap:Envelope>'
        xml_delay = '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><soap:Body><GetServiceDetailsResponse xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/"><GetServiceDetailsResult><generatedAt xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">2015-02-25T23:54:44.3466941+00:00</generatedAt><serviceType xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">train</serviceType><locationName xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">Swansea</locationName><crs xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">SWA</crs><operator xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">First Great Western</operator><operatorCode xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">GW</operatorCode><disruptionReason xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">This train has been delayed by emergency services dealing with an incident</disruptionReason><sta xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">23:22</sta><eta xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">00:00</eta><previousCallingPoints xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types"><callingPointList serviceType="train" serviceChangeRequired="false" assocIsCancelled="false"><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">London Paddington</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">PAD</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">20:15</st><at xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">On time</at></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Reading</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">RDG</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">20:41</st><at xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">20:45</at></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Didcot Parkway</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">DID</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">20:57</st><at xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">21:02</at></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Swindon</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">SWI</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">21:15</st><at xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">21:20</at></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Bristol Parkway</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">BPW</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">21:41</st><at xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">21:48</at></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Newport (South Wales)</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">NWP</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">22:05</st><at xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">22:10</at></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Cardiff Central</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">CDF</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">22:26</st><at xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">On time</at></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Bridgend</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">BGN</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">22:48</st><at xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">23:27</at></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Port Talbot Parkway</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">PTA</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">23:01</st><at xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">23:40</at></callingPoint><callingPoint><locationName xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Neath</locationName><crs xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">NTH</crs><st xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">23:09</st><at xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">23:49</at></callingPoint></callingPointList></previousCallingPoints><subsequentCallingPoints xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types" /></GetServiceDetailsResult></GetServiceDetailsResponse></soap:Body></soap:Envelope>'
        xml = Nokogiri::XML(xml_delay)
      else
        response = RestClient.post URL, SOAP_HEADERS + soap_body, content_type: 'text/xml'
        xml = Nokogiri::XML(response.body)
      end
    rescue => e
      puts e.inspect
      return
    end
    xml.remove_namespaces!
    service = Service.new service_id
    service.parse(xml)
    return service
  end


  def self.get_board type, crs
    soap_body = '<SOAP-ENV:Body><ns1:Get' + type + 'Request><ns1:crs>' + crs + '</ns1:crs></ns1:Get' + type + 'Request></SOAP-ENV:Body></SOAP-ENV:Envelope>'
    begin
      if DEBUG
        xml = '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><soap:Body><GetDepartureBoardResponse xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/"><GetStationBoardResult><generatedAt xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">2015-02-25T23:08:37.5735282+00:00</generatedAt><locationName xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">London Paddington</locationName><crs xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">PAD</crs><nrccMessages xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types"><message xmlns="http://thalesgroup.com/RTTI/2012-01-13/ldb/types">Trains between Port Talbot Parkway and Swansea are being delayed by up to 60 minutes. More details can be found in &lt;A href="http://nationalrail.co.uk/service_disruptions/92104.aspx"&gt;Latest Travel News&lt;/A&gt;.</message></nrccMessages><platformAvailable xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types">true</platformAvailable><trainServices xmlns="http://thalesgroup.com/RTTI/2014-02-20/ldb/types"><service><origin><location><locationName>London Paddington</locationName><crs>PAD</crs><via /><futureChangeTo /></location></origin><destination><location><locationName>Heathrow Airport T4</locationName><crs>HAF</crs><via /><futureChangeTo /></location></destination><std>23:07</std><etd>On time</etd><operator>Heathrow Connect</operator><operatorCode>HC</operatorCode><serviceID>hmoTRM29TJAPD1+yrqQ10w==</serviceID></service><service><origin><location><locationName>London Paddington</locationName><crs>PAD</crs><via /><futureChangeTo /></location></origin><destination><location><locationName>Oxford</locationName><crs>OXF</crs><via /><futureChangeTo /></location></destination><std>23:18</std><etd>On time</etd><platform>5</platform><operator>First Great Western</operator><operatorCode>GW</operatorCode><serviceID>oh4svgXe0BZEzGDjYgkfHQ==</serviceID></service><service><origin><location><locationName>London Paddington</locationName><crs>PAD</crs><via /><futureChangeTo /></location></origin><destination><location><locationName>Heathrow Airport T5</locationName><crs>HWV</crs><via /><futureChangeTo /></location></destination><std>23:25</std><etd>On time</etd><platform>6</platform><operator>Heathrow Express</operator><operatorCode>HX</operatorCode><serviceID>SI4MS+WF6C1BlqNEV0tVIA==</serviceID></service><service><origin><location><locationName>London Paddington</locationName><crs>PAD</crs><via /><futureChangeTo /></location></origin><destination><location><locationName>Cardiff Central</locationName><crs>CDF</crs><via /><futureChangeTo /></location></destination><std>23:30</std><etd>On time</etd><platform>4</platform><operator>First Great Western</operator><operatorCode>GW</operatorCode><serviceID>zFdxQz8NuRWM364c9f4Qig==</serviceID></service><service><origin><location><locationName>London Paddington</locationName><crs>PAD</crs><via /><futureChangeTo /></location></origin><destination><location><locationName>Oxford</locationName><crs>OXF</crs><via /><futureChangeTo /></location></destination><std>23:33</std><etd>On time</etd><operator>First Great Western</operator><operatorCode>GW</operatorCode><serviceID>GSXLiE3+mJhO96chNxxI5A==</serviceID></service><service><origin><location><locationName>London Paddington</locationName><crs>PAD</crs><via /><futureChangeTo /></location></origin><destination><location><locationName>Penzance</locationName><crs>PNZ</crs><via /><futureChangeTo /></location></destination><std>23:45</std><etd>On time</etd><platform>1</platform><operator>First Great Western</operator><operatorCode>GW</operatorCode><serviceID>azR6WmuPCn9kI8xst82T0A==</serviceID></service><service><origin><location><locationName>London Paddington</locationName><crs>PAD</crs><via /><futureChangeTo /></location></origin><destination><location><locationName>Reading</locationName><crs>RDG</crs><via /><futureChangeTo /></location></destination><std>23:49</std><etd>On time</etd><operator>First Great Western</operator><operatorCode>GW</operatorCode><serviceID>jiOdHeaFmQOmwAlZhNoVFg==</serviceID></service><service><origin><location><locationName>London Paddington</locationName><crs>PAD</crs><via /><futureChangeTo /></location></origin><destination><location><locationName>Oxford</locationName><crs>OXF</crs><via /><futureChangeTo /></location></destination><std>00:22</std><etd>On time</etd><operator>First Great Western</operator><operatorCode>GW</operatorCode><serviceID>KFyfemWa74xIl7KE/SWl/w==</serviceID></service><service><origin><location><locationName>London Paddington</locationName><crs>PAD</crs><via /><futureChangeTo /></location></origin><destination><location><locationName>Reading</locationName><crs>RDG</crs><via /><futureChangeTo /></location></destination><std>00:34</std><etd>On time</etd><operator>First Great Western</operator><operatorCode>GW</operatorCode><serviceID>twVt66LbQgQWhDVuH/88kA==</serviceID></service></trainServices></GetStationBoardResult></GetDepartureBoardResponse></soap:Body></soap:Envelope>'
        xml = Nokogiri::XML(xml)
      else
        response = RestClient.post URL, SOAP_HEADERS + soap_body, content_type: 'text/xml'
        xml = Nokogiri::XML(response.body)
      end
    rescue => e
      puts e.inspect
      return
    end
    xml.remove_namespaces!
    station_board = StationBoard.new
    station_board.parse(xml)
    return station_board
  end


end
