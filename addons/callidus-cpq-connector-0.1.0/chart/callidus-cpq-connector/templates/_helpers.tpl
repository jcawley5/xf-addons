{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "bundle.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s" $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "oauth_proxy_service" -}}
{{- printf "http://%s.%s:8080" .Values.apiProxyName .Release.Namespace | trimAll " " | quote -}}
{{- end -}}

{{- define "formparameters_csv" -}}
{{- printf "grant_type=password,username=%s,password=%s,domain=%s" .Values.username .Values.password .Values.domain | trimAll " " | b64enc -}}
{{- end -}}

{{- define "headers_csv" -}}
{{- printf "Content-Type=application/x-www-form-urlencoded" | trimAll " " | b64enc -}}
{{- end -}}

{{- define "oauthURL" -}}
{{- printf "%s/basic/api/token" .Values.system_url | trimAll " " | b64enc -}}
{{- end -}}

{{- define "event_gateway_url" -}}
{{- printf "%s-%s.%s" .Values.eventGatewayName .Release.Namespace .Values.cluster_domain | trimAll " " -}}
{{- end -}}






    

