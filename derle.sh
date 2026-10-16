#!/bin/bash
# kaynak|hedef_ad|baslangic|sure
O=~/video-portfoy-site/v
while IFS='|' read -r src ad ss t; do
  [ -z "$src" ] && continue
  out="$O/$ad.mp4"; [ -f "$out" ] && continue
  args=(); [ -n "$ss" ] && args+=(-ss "$ss"); [ -n "$t" ] && args+=(-t "$t")
  ffmpeg -nostdin -v error -y "${args[@]}" -i "$HOME/$src" -vf "scale='if(gt(iw,ih),min(1280,iw),-2)':'if(gt(iw,ih),-2,min(1280,ih))'" -c:v libx264 -preset medium -crf 27 -pix_fmt yuv420p -c:a aac -b:a 96k -movflags +faststart "$out" || echo "HATA $src"
  ffmpeg -nostdin -v error -y -ss 1 -i "$out" -frames:v 1 -vf "scale=640:-2" -q:v 4 "$O/$ad.jpg"
done <<'L'
futcointr/video/2026-10-01-fut-coin-satin-al/fut-coin-satin-al-2027.mp4|futcointr-yatay-tanitim|0|75
futcointr/video/2026-10-01-fut-coin-satin-al/shorts/futcointr-fut-coin-satin-al-short-1.mp4|futcointr-short||
freelance-gig/ycanaydin_hasbik/fin/Hasbik_1080p_final.mp4|hasbik-animasyon||
freelance-gig/bionluk-yeni-ilanlar-0930/intro_demo.mp4|kisa-tanitim-intro||
freelance-gig/bionluk-ilanlar-0928/demo_video.mp4|dikey-reklam-demo||
freelance-gig/bionluk-ilanlar-0928/ses_demo.mp4|ses-temizleme-once-sonra||
freelance-gig/alialtug_erilsa/erilsa_ornek_v2.mp4|erilsa-urun-reklami||
r10/_out/2026-09-29/vahit-demo/Kurumsal-Film-Ornek-Bolum-wa.mp4|kurumsal-film||
evmc/build/karakter/pilot-800v/volt-pilot-800v-v2-tatli.mp4|volt-karakter||
r10/_out/video-portfoy/wa/tir-park-tanitim.mp4|tir-park-tanitim||
r10/_out/video-portfoy/wa/etutpanel-tanitim.mp4|etutpanel-saas-tanitim||
r10/_out/video-portfoy/wa/skyrunner-promo.mp4|oyun-promo||
r10/_out/video-portfoy/wa/seyahat-reklam.mp4|seyahat-reklam||
klipfabrika/out/meta-reklam-0924/meta-cop-hf.mp4|urun-reklami-meta||
klipfabrika/out/meta-reklam-0924/meta-kumanda-c.mp4|urun-reklami-kumanda||
shedloop/kus-reklam/out/shedloop-kus-9x16.mp4|pet-urun-reklami||
shedloop/creatives/ads/shedloop-v2-before-after-9x16.mp4|once-sonra-reklam||
vicelens/shorts/out/s3-lucia.mp4|oyun-haber-short||
vicelens/video/out/long-everything-confirmed-small.mp4|youtube-uzun-video|0|60
ilanvideo-pilot-0925/pilot-airbnb/villa-onat-DRONE-ORNEKTIR_whatsapp.mp4|villa-drone-tur||
ilanvideo-pilot-0925/gece/kalkanhomes/kalkanhomes-tur-ORNEKTIR_whatsapp.mp4|emlak-tur||
ilanvideo-pilot-0925/tidesoft-reels/tidesoft-reels-ORNEKTIR_whatsapp.mp4|otel-reels||
r10/_out/blender-demo/fuar/fuar_tur.mp4|blender-fuar-standi||
r10/_out/2026-09-30/salincak-derya/urun/salincakli-biblo-tanitim.mp4|3d-biblo-turntable||
gamenpc3d/medya-0929/vid/ninja-raw.mp4|3d-figur-turntable||
sepetzone-meta-reklam-2026-10/ugc/v3/cop-ugc-v3-TASLAK.mp4|sepetzone-ugc-cop||
sepetzone-meta-reklam-2026-10/ugc/v4/kapi/kapi-ugc-v4-TASLAK.mp4|sepetzone-ugc-kapidur||
sepetzone-meta-reklam-2026-10/ugc/v4/kumanda/kumanda-ugc-v4-TASLAK.mp4|sepetzone-ugc-kumanda||
sepetzone-meta-reklam-2026-10/ugc/v4/kablo/kablo-ugc-v4-TASLAK.mp4|sepetzone-ugc-kablo||
sepetzone-meta-reklam-2026-10/ugc/v4/kedi/kedi-ugc-v4-TASLAK.mp4|sepetzone-ugc-kedikum||
L
ls -la $O | awk '{s+=$5} END{print "toplam MB", s/1048576}'
